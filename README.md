## Setup Codegen CLI

The Codegen CLI is an essential tool provided by the Apollo iOS SPM package.
* Right click on the project file in the file explorer, Select the Install CLI plugin command. This will initiate the installation process for the Codegen CLI.
* Once the installation is complete, a symbolic link named `apollo-ios-cli` will be created in your project's root folder. This link points to the actual executable of the Codegen CLI.

## Create your Codegen Config
In the terminal, navigate to the root directory where you can find `apollo-ios-cli` and run the below command

`./apollo-ios-cli init --schema-namespace GraphQLAPI --module-type swiftPackageManager`

This command generates a basic `apollo-codegen-config.json` file related to your project.

## Download schema
Open `apollo-codegen-config.json` and add the below JSON code next to `output` object.

```
"schemaDownloadConfiguration": {
    "downloadMethod": {
        "introspection": {
            "endpointURL": "https://api.chargetrip.io/graphql",
            "httpMethod": {
                "POST": {}
            },
            "includeDeprecatedInputValues": false,
            "outputFormat": "SDL"
        }
    },
    "downloadTimeout": 60,
    "headers": [],
    "outputPath": "./graphql/schema.graphqls"
}

```

Now fetch the schema using the below command - 
`./apollo-ios-cli fetch-schema`

Now you'll see the `schema.graphqls` in the `graphql` folder which contains the downloaded schema from the server

