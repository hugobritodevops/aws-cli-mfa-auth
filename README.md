# aws-cli-mfa-auth

Bash script to automate AWS CLI credential refresh with MFA. Securely manage temporary credentials for local development and DevOps tasks with Terraform, Ansible, and more—no need for AWS Cloud9. Ideal for anyone using MFA-protected AWS accounts.

---

## Why Use This Approach?

Many teams use AWS Cloud9 as a cloud-based development environment, which provides pre-configured credentials and easy access to AWS resources. However, there are important reasons to set up secure, local access with MFA:

- **Cloud9 might not be available** in your AWS account, due to cost, region availability, or organizational restrictions.
- **Local development is often faster and more customizable**, with access to your favorite IDE (like VS Code) and personalized settings.
- **Security is critical:** AWS recommends using temporary credentials and Multi-Factor Authentication (MFA) to reduce risk of key exposure.
- **Some companies require all AWS access (even for automation) to use MFA**, making static credentials unsafe or non-compliant.
- **You want to run Terraform, Ansible, or scripts locally**—but need a simple way to rotate temporary credentials without manual steps.

**This script solves all of these challenges by:**

- Making it easy to work locally and securely with the AWS CLI, even when Cloud9 is not an option.
- Automating the rotation of temporary credentials using MFA, reducing the risk of leaks and keeping your AWS environment secure.
- Allowing you to integrate with any DevOps workflow (Terraform, Ansible, etc.) from your local machine, while meeting AWS security best practices.

> **Summary:**  
> With this approach, you keep your local development fast, flexible, and secure—without relying on AWS Cloud9 or risking your AWS account.

---

## Usage

1. **Edit the script variables** at the top of `aws-mfa.sh` to match your AWS account and profiles:
    ```bash
    MFA_ARN="arn:aws:iam::YOUR_AWS_ACCOUNT_ID:mfa/YOUR_MFA_DEVICE_NAME"
    DURATION=43200 # 12h
    PROFILE=longterm
    TARGET_PROFILE=default
    ```

2. **Make the script executable:**
    ```bash
    chmod +x aws-mfa.sh
    ```

3. **Run the script:**
    ```bash
    ./aws-mfa.sh
    ```

4. **Enter your MFA code** when prompted.

After running, your AWS CLI `default` profile will be updated with temporary credentials using MFA—ready for secure use with Terraform, Ansible, or other tools.

---

## Requirements

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [jq](https://stedolan.github.io/jq/)

---

## Example

```bash
$ ./aws-mfa.sh
Enter your MFA code: 123456
[INFO] Temporary credentials applied to profile "default".
```

---

# Contact

Want to stay in touch or discuss DevOps, AWS, and automation?
Follow or contact me here:

- [LinkedIn](https://www.linkedin.com/in/hugodevops)
- [Medium](https://medium.com/@hugodevops)