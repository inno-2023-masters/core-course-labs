set -x OS_AUTH_URL "https://infra.mail.ru:35357/v3/"

set -x OS_PROJECT_ID "05941ecf46f349d48406cc73e6c4de69"
set -x OS_REGION_NAME "RegionOne"
 
set -x OS_USERNAME "mail.e16k8@platun0v.ru"
set -x OS_USER_DOMAIN_NAME "users"
 
# With Keystone you pass the keystone password.
echo "Please enter your OpenStack Password for project $OS_PROJECT_ID as user $OS_USERNAME: "
read -s OS_PASSWORD_INPUT
set -x OS_PASSWORD $OS_PASSWORD_INPUT

set -x OS_INTERFACE public
set -x OS_IDENTITY_API_VERSION 3
