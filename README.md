## [fastlane match](https://github.com/fastlane/fastlane/tree/master/match#readme)

This repository contains all your certificates and provisioning profiles needed to build and sign your applications. They are encrypted using OpenSSL via a passphrase.

**Important:** Make sure this repository is set to private and only your team members have access to this repo.

Do not modify this file, as it gets overwritten every time you run `match`.

### Install [fastlane match](https://github.com/fastlane/fastlane/tree/master/match#readme)

```
sudo gem install fastlane
```

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

### Usage

Navigate to your project folder and run

```
fastlane match appstore
```
```
fastlane match adhoc
```
```
fastlane match development
```

For more information open [fastlane match git repo](https://github.com/fastlane/fastlane/tree/master/match#readme)

### Content

#### certs

This directory contains all your certificates with their private keys

#### profiles

This directory contains all provisioning profiles

------------------------------------

For more information open [fastlane match git repo](https://github.com/fastlane/fastlane/tree/master/match#readme)
