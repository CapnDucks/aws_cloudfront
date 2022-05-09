## Requirements
### Setup these tools:

| Name | Version |
|------|---------|
| [terraform](https://git.renaissance.com/jelliott/tf_switch) | ~> 1.1 |
| [github cli](https://cli.github.com) | latest |
| [pre-commit](https://pre-commit.com) | latest |
| [terraform-docs](https://github.com/terraform-docs/terraform-docs) | latest |
| [TFLint](https://github.com/terraform-linters/tflint) | latest |
| [checkov](https://github.com/bridgecrewio/checkov) | latest |

## How to use
### Create the script below and put it in your $PATH
### Create a new EMPTY directory and run the script: 

script-name: `tf_modules.sh`
```
#!/bin/bash
RED=$(tput setaf 1)
BLUE=$(tput setaf 153)
NORMAL=$(tput sgr0)
MODULE="$(basename "${PWD}")"
SKEL="https://git.renaissance.com/tfmodules/skel.git"

git clone "$SKEL" ./ 2> /dev/null
if [ $? != 0 ]; then
  echo "Directory not empty (or not on VPN)"
  exit 1
fi

rm -rf .git readme.md
git init
git branch -M main
printf "${BLUE}Automatically creating the repo and adding the remote:\n${NORMAL}"
gh repo create tfmodules/$MODULE --public
git remote add origin git@git.renaissance.com:tfmodules/$MODULE
git remote -v
printf "${BLUE}Updating and installing pre-commit hooks\n${NORMAL}"
pre-commit autoupdate
pre-commit install --install-hooks
printf "${BLUE}Creating 'main' branch and committing files\n${NORMAL}"
git branch -M main
git add .
git commit -am "Auto first commit"
git push -u origin main
printf "${BLUE}Ready to start creating!\n${NORMAL}"
```

### The script will do the following:
- do a `git clone` to the current directory
- initialise a new git repo in the current directory
- delete the readme.md that currently exists
- create a new branch named `main`
- create a *new* repo on git.renaissance.com in the tfmodules organisation
- create your `git remote add origin ...`  for you
- updating and installing the `pre-commit` hooks
- creating a first commit to your newly created git repo


## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnets.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Name of the apex domain | `string` | `"renaissance-golabs.com"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | `"zone-vpc.us-east-1-*"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_subnets"></a> [lambda\_subnets](#output\_lambda\_subnets) | Lambda subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
