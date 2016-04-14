# chef-symfony-parameters
Cookbook to manage parameters.yml file, allows for site-cookboks/ to be used to provide the erb, configset creation to reuse for multiple instances with the same parameter

# Example
```
"symfony": {
  "configset": {
    "production": {
      "template": "production/parameters.yml.erb",
      "cookbook": "my-website-parameters"
    },
    "staging": {
      "template": "staging/parameters.yml.erb",
      "cookbook": "my-website-parameters"
    }
  }
  "config": {
    "staging-uat": {
      "file": "/var/www/uat/shared/app/config/parameters.yml",
      "config": "staging"
    },
   "staging-e2e": {
      "file": "/var/www/e2e/shared/app/config/parameters.yml",
      "config": "staging"
    }
  }
}
```
