#!/bin/bash
# -----------------------------------------------------------------------------
# package: ultralight provisioning system
# author: Daniel Kovacs <mondomhogynincsen@gmail.com>
# licence: MIT <https://opensource.org/licenses/MIT>
# file-version: 1.0
# file-purpose: google app engine setup
# -----------------------------------------------------------------------------


# -----------------------------------------------------------
# _ups_gae_configure
# -----------------------------------------------------------

function _ups_gae_configure() {

    # -----------------------------------------------------------
    # packages
    # -----------------------------------------------------------

    SYSTEM_PACKAGES+=(
        google-cloud-sdk
        google-cloud-sdk-app-engine-python-extras
        google-cloud-sdk-app-engine-python
        # google-cloud-sdk-datastore-emulator
        # google-cloud-sdk-app-engine-java
        # google-cloud-sdk-app-engine-go
        # google-cloud-sdk-bigtable-emulator
        # google-cloud-sdk-datalab
        # google-cloud-sdk-datastore-emulator
        # google-cloud-sdk-cbt
        google-cloud-sdk-cloud-build-local
        # google-cloud-sdk-pubsub-emulator
        kubectl
    )
}


# -----------------------------------------------------------
# _ups_gae_validate
# -----------------------------------------------------------

function _ups_gae_validate() {
    :
}


# -----------------------------------------------------------
# _ups_gae_pre_install
# -----------------------------------------------------------

function _ups_gae_pre_install() {

    # -----------------------------------------------------------
    # write repofile
    # -----------------------------------------------------------

    local repo_file="/etc/yum.repos.d/google-cloud-sdk.repo"
    
    if [[ ! -f ${repo_file} ]]; then 
        _ups_log_info "adding gae repositories..."
        cat > $repo_file <<EOF
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
    else
        _ups_log_notice "skip: gae repositories are already installed."
    fi


}


# -----------------------------------------------------------
# _ups_gae_setup
# -----------------------------------------------------------

function _ups_gae_setup() {
    # -----------------------------------------------------------
    # appcfg.py
    # -----------------------------------------------------------
    
    chmod -v +x /usr/lib64/google-cloud-sdk/platform/google_appengine/appcfg.py
    ln -sfv /usr/lib64/google-cloud-sdk/platform/google_appengine/appcfg.py /usr/local/bin

}


# -----------------------------------------------------------
# _ups_gae_verify
# -----------------------------------------------------------

function _ups_gae_verify() {
    :
}


