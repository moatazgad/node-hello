This project creates a Node.js app with:

- CI/CD pipeline using **GitHub Actions**
- Dockerized deployment to **Docker Hub**
- Infrastructure provisioning via **Terraform** (locally)
- Monitoring via **New Relic**
---

### CI Pipeline

- **Pipeline is defined in `.github/workflows/ci.yml` **
- **Triggered on `push` or `pull-request` to `master`**
- **Consists of 2 jobs `lint` and `build & deploy`**
- `build & deploy` job depends on `lint` job.
- **Authenticates to Docker Hub via secrets**
- **Ran the following commands to install `eslint`**
```bash
npm install --save-dev eslint

npx eslint --init
```
---
### Terraform

- **Docker module was created in `terraform/modules/docker`**
- **Creates 3 Resources (docker image, docker container, docker network, optionally docker volume if set)**
- **Outputs: `container_id`, `container_name`, `network_id`, `network_name`, `app_url`**
---

### New Relic 

##### **Setup**

- Add `newrelic` to your `package.json` dependencies
- Initialized via `require('newrelic')` in `index.js`
- Configure it using these ENV variables in the `Dockerfile`:
	- ENV NEW_RELIC_NO_CONFIG_FILE
	- ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED
	- ENV NEW_RELIC_LOG
- Defined the command to run the app in `DOCKERFILE` 
```DOCKERFILE
CMD ["node", "-r", "newrelic", "index.js"]
```
- Configure with the following `ENVS` in `terraform` module:
	- NEW_RELIC_LICENSE_KEY
	- NEW_RELIC_APP_NAME
- Compatible with `Node` Versions >= `20`

---
### To Run The Project


**Prerequisites**
- GIT
- Docker
- Terraform

**Steps to deploy**
- Clone the Repo
- DockerHub credentials for pushing image are stored as secrets in Github Secrets  (Called when using `Github Actions CI`)
- Pipeline is triggered upon merging to master or creating a PR
- `terraform.tfvars` was not pushed to repo for security
- Create a `terraform.tfvars` file by copying `terraform.tfvars.example`, then update it with your configuration:

- To create the infrastructure
```bash
cd terraform/environments/dev
```
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```

**App will be deployed to** `http://localhost:3000`