# test7
Terraform test

## Task

Use Terraform to provide a static website backed by an S3 bucket in AWS.

Documentation on different (non-terraform)implementations to this problem can be found here: https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html, It is acceptable to re-use existing terraform module libraries.


You will be asked to demonstrate your solution in the interview.

- Your web site should be accessible to the public internet.
- Please make your source code available in a publicly accessible location.


Things to consider:

- Others in your team should be able to maintain the solution.
- How you would measure the quality of your solution?

## Assumptions
- Terraform state file infrastructure already exists
- Each environment has its own AWS account
- CI platform has access to AWS
- Assets cache settings will be controlled by the application deployment
