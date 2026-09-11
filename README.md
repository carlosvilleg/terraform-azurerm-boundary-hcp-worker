
# Prerequisites

- A resource group needs to exist where the workers will be deployed
- The vNet also needs to exist in the same region as the worker deployment

# Using a custom image

To use a custom image provide either both the custom image name and rg if it's in the same subscription as the workers. Or in any case provide the full image id as the image name and leave the image rg null.

