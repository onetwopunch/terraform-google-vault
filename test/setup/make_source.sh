#!/usr/bin/env bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "#!/usr/bin/env bash" > ../source.sh

project_id=$(terraform output project_id)
echo "export TF_VAR_project_id='$project_id'" >> ../source.sh

org_id=$(terraform output org_id)
echo "export TF_VAR_org_id='$org_id'" >> ../source.sh

folder_id=$(terraform output folder_id)
echo "export TF_VAR_folder_id='$folder_id'" >> ../source.sh

billing_account=$(terraform output billing_account)
echo "export TF_VAR_billing_account='$billing_account'" >> ../source.sh

sa_email=$(terraform output sa_email)
echo "export TF_VAR_service_account='{email=\"$sa_email\", scopes = [\"cloud-platform\"]}'"  >> ../source.sh

sa_key=$(terraform output sa_key | base64 --decode)
echo "export SERVICE_ACCOUNT_JSON='$sa_key'"  >> ../source.sh

