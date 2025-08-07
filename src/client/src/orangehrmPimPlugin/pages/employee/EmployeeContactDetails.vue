<!--
/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software: you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation, either
 * version 3 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with OrangeHRM.
 * If not, see <https://www.gnu.org/licenses/>.
 */
 -->

<template>
  <edit-employee-layout :employee-id="empNumber" screen="contact">
    <div class="orangehrm-horizontal-padding orangehrm-vertical-padding">
      <oxd-text tag="h6" class="orangehrm-main-title">{{
        $t('pim.contact_details')
      }}</oxd-text>
      <oxd-divider />
      
      <!-- Enhanced Contact Details Form -->
      <oxd-form :loading="isLoading" @submit-valid="onSave">
        
        <!-- Address Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">{{
          $t('admin.address')
        }}</oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.street1"
                :label="$t('pim.street1')"
                :rules="rules.street1"
                :placeholder="$t('pim.enter_street1')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.street2"
                :label="$t('pim.street2')"
                :rules="rules.street2"
                :placeholder="$t('pim.enter_street2')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.city"
                :label="$t('general.city')"
                :rules="rules.city"
                :placeholder="$t('pim.enter_city')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.province"
                :label="$t('general.state_province')"
                :rules="rules.province"
                :placeholder="$t('pim.enter_province')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.zipCode"
                :label="$t('general.zip_postal_code')"
                :rules="rules.zipCode"
                :placeholder="$t('pim.enter_zip_code')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.countryCode"
                type="select"
                :label="$t('general.country')"
                :options="countries"
                :placeholder="$t('pim.select_country')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- University Address Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">{{
          $t('pim.university_address')
        }}</oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityStreet"
                :label="$t('pim.university_street')"
                :rules="rules.universityStreet"
                :placeholder="$t('pim.enter_university_street')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityCity"
                :label="$t('pim.university_city')"
                :rules="rules.universityCity"
                :placeholder="$t('pim.enter_university_city')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityProvince"
                :label="$t('pim.university_province')"
                :rules="rules.universityProvince"
                :placeholder="$t('pim.enter_university_province')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityZipCode"
                :label="$t('pim.university_zip_code')"
                :rules="rules.universityZipCode"
                :placeholder="$t('pim.enter_university_zip_code')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityCountryCode"
                type="select"
                :label="$t('pim.university_country')"
                :options="countries"
                :placeholder="$t('pim.select_university_country')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityBuilding"
                :label="$t('pim.university_building')"
                :rules="rules.universityBuilding"
                :placeholder="$t('pim.enter_university_building')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Telephone Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">{{
          $t('pim.telephone')
        }}</oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.homeTelephone"
                :label="$t('pim.home')"
                :rules="rules.homeTelephone"
                :placeholder="$t('pim.enter_home_telephone')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.mobile"
                :label="$t('general.mobile')"
                :rules="rules.mobile"
                :placeholder="$t('pim.enter_mobile')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.workTelephone"
                :label="$t('pim.work')"
                :rules="rules.workTelephone"
                :placeholder="$t('pim.enter_work_telephone')"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.emergencyContact"
                :label="$t('pim.emergency_contact')"
                :rules="rules.emergencyContact"
                :placeholder="$t('pim.enter_emergency_contact')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.fax"
                :label="$t('pim.fax')"
                :rules="rules.fax"
                :placeholder="$t('pim.enter_fax')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model.trim="contact.voip"
                :label="$t('pim.voip')"
                :rules="rules.voip"
                :placeholder="$t('pim.enter_voip')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Email Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">{{
          $t('general.email')
        }}</oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.workEmail"
                :label="$t('general.work_email')"
                :rules="rules.workEmail"
                :placeholder="$t('pim.enter_work_email')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.otherEmail"
                :label="$t('general.other_email')"
                :rules="rules.otherEmail"
                :placeholder="$t('pim.enter_other_email')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.universityEmail"
                :label="$t('pim.university_email')"
                :rules="rules.universityEmail"
                :placeholder="$t('pim.enter_university_email')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Social Media Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">{{
          $t('pim.social_media')
        }}</oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.linkedin"
                :label="$t('pim.linkedin')"
                :rules="rules.linkedin"
                :placeholder="$t('pim.enter_linkedin')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.twitter"
                :label="$t('pim.twitter')"
                :rules="rules.twitter"
                :placeholder="$t('pim.enter_twitter')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="contact.website"
                :label="$t('pim.website')"
                :rules="rules.website"
                :placeholder="$t('pim.enter_website')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <oxd-divider />
        <oxd-form-actions>
          <required-text />
          <submit-button />
        </oxd-form-actions>
      </oxd-form>
    </div>
  </edit-employee-layout>
</template>

<script>
import {APIService} from '@ohrm/core/util/services/api.service';
import EditEmployeeLayout from '@/orangehrmPimPlugin/components/EditEmployeeLayout';
import {
  shouldNotExceedCharLength,
  validPhoneNumberFormat,
  validEmailFormat,
  validUrlFormat,
} from '@ohrm/core/util/validation/rules';
import {promiseDebounce} from '@ohrm/oxd';

const contactDetailsModel = {
  street1: '',
  street2: '',
  city: '',
  province: '',
  countryCode: [],
  zipCode: '',
  homeTelephone: '',
  workTelephone: '',
  mobile: '',
  workEmail: '',
  otherEmail: '',
  universityStreet: '',
  universityCity: '',
  universityProvince: '',
  universityCountryCode: [],
  universityZipCode: '',
  universityBuilding: '',
  emergencyContact: '',
  fax: '',
  voip: '',
  universityEmail: '',
  linkedin: '',
  twitter: '',
  website: '',
};

export default {
  components: {
    'edit-employee-layout': EditEmployeeLayout,
  },

  props: {
    empNumber: {
      type: String,
      required: true,
    },
    countries: {
      type: Array,
      default: () => [],
    },
  },

  setup(props) {
    const http = new APIService(
      window.appGlobal.baseUrl,
      `/api/v2/pim/employee/${props.empNumber}/contact-details`,
    );
    http.setIgnorePath(
      '/api/v2/pim/employees/[0-9]+/contact-details/validation/(work-emails|other-emails)',
    );
    return {
      http,
    };
  },

  data() {
    return {
      isLoading: false,
      contact: {...contactDetailsModel},
      rules: {
        street1: [shouldNotExceedCharLength(70)],
        street2: [shouldNotExceedCharLength(70)],
        city: [shouldNotExceedCharLength(70)],
        province: [shouldNotExceedCharLength(70)],
        zipCode: [shouldNotExceedCharLength(10)],
        homeTelephone: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        mobile: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        workTelephone: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        emergencyContact: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        fax: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        voip: [shouldNotExceedCharLength(25), validPhoneNumberFormat],
        workEmail: [
          shouldNotExceedCharLength(50),
          validEmailFormat,
          promiseDebounce(this.validateWorkEmail, 500),
        ],
        otherEmail: [
          shouldNotExceedCharLength(50),
          validEmailFormat,
          promiseDebounce(this.validateOtherEmail, 500),
        ],
        universityEmail: [
          shouldNotExceedCharLength(50),
          validEmailFormat,
        ],
        universityStreet: [shouldNotExceedCharLength(70)],
        universityCity: [shouldNotExceedCharLength(70)],
        universityProvince: [shouldNotExceedCharLength(70)],
        universityZipCode: [shouldNotExceedCharLength(10)],
        universityBuilding: [shouldNotExceedCharLength(50)],
        linkedin: [shouldNotExceedCharLength(100), validUrlFormat],
        twitter: [shouldNotExceedCharLength(100)],
        website: [shouldNotExceedCharLength(100), validUrlFormat],
      },
    };
  },

  beforeMount() {
    this.isLoading = true;
    this.http
      .getAll()
      .then((response) => {
        this.updateModel(response);
      })
      .finally(() => {
        this.isLoading = false;
      });
  },

  methods: {
    onSave() {
      this.isLoading = true;
      this.http
        .request({
          method: 'PUT',
          data: {
            ...this.contact,
            countryCode: this.contact.countryCode?.id,
            universityCountryCode: this.contact.universityCountryCode?.id,
          },
        })
        .then((response) => {
          this.updateModel(response);
          return this.$toast.updateSuccess();
        })
        .then(() => {
          this.isLoading = false;
        });
    },

    validateWorkEmail(contact) {
      return new Promise((resolve) => {
        if (contact) {
          this.http
            .request({
              method: 'GET',
              url: `/api/v2/pim/employees/${this.empNumber}/contact-details/validation/work-emails`,
              params: {
                workEmail: this.contact.workEmail,
              },
            })
            .then((response) => {
              const {data} = response.data;
              if (data.valid === true) {
                return resolve(true);
              }
              return resolve(this.$t('general.already_exists'));
            });
        } else {
          resolve(true);
        }
      });
    },

    validateOtherEmail(contact) {
      return new Promise((resolve) => {
        if (contact) {
          const sameAsWorkEmail =
            this.contact.otherEmail === this.contact.workEmail;
          this.http
            .request({
              method: 'GET',
              url: `/api/v2/pim/employees/${this.empNumber}/contact-details/validation/other-emails`,
              params: {
                otherEmail: this.contact.otherEmail,
              },
            })
            .then((response) => {
              const {data} = response.data;
              if (data.valid === true) {
                return sameAsWorkEmail
                  ? resolve(
                      this.$t(
                        'pim.work_email_and_other_email_cannot_be_the_same',
                      ),
                    )
                  : resolve(true);
              }
              return resolve(this.$t('general.already_exists'));
            });
        } else {
          resolve(true);
        }
      });
    },

    validateEmailDifferent(email) {
      return (v) => {
        const resolvedEmail = email();
        if (resolvedEmail === null || resolvedEmail === '') {
          return true;
        }
        return (
          v !== resolvedEmail ||
          this.$t('pim.work_email_and_other_email_cannot_be_the_same')
        );
      };
    },

    updateModel(response) {
      const {data} = response.data;
      this.contact = {...contactDetailsModel, ...data};
      this.contact.countryCode = this.countries.find(
        (item) => item.id === data.countryCode,
      );
      this.contact.universityCountryCode = this.countries.find(
        (item) => item.id === data.universityCountryCode,
      );
    },
  },
};
</script>

<style src="./employee.scss" lang="scss" scoped></style>
