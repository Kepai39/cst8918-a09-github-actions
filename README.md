CST8918 - DevOps: Infrastructure as Code
Prof: Robert McKenney
Student: Catherine Daigle - 41175118

# Hybrid-A09 Husky and GitHub Actions


## Issues I Have Encountered:
I had issues with the workflow as the terraform was validating the syntax although the syntax was wrong.  To improve and test error I added the action to activate on push: -main.  The issue was solved by using dflook/terraform-validate@v1 as I needed to validate within the correct folder (infrastructure).  The false positive was caused because it was validating files in the incorrect folder.

The extra branch is used for pull requests to activate the github actions.

## Succesfull screenshot Results:
![The succesfull and fail workflows depending on syntax](<Screenshot 2025-03-07 at 5.23.42 PM.png>)

## Resources:
Flook, Daniel. (2025). terraform-validate—GitHub Marketplace. GitHub. https://github.com/marketplace/actions/terraform-validate

