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
  <div class="orangehrm-horizontal-padding orangehrm-vertical-padding">
    <oxd-text tag="h6" class="orangehrm-main-title">
      {{ $t('pim.edit_emergency_contact') }}
    </oxd-text>
    <oxd-divider />
    
    <!-- Enhanced Emergency Contact Form -->
    <oxd-form :loading="isLoading" @submit-valid="onSave">
      
      <!-- Basic Information Section -->
      <oxd-text class="orangehrm-sub-title" tag="h6">
        {{ $t('pim.basic_information') }}
      </oxd-text>
      <oxd-divider />
      
      <oxd-form-row>
        <oxd-grid :cols="3" class="orangehrm-full-width-grid">
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.name"
              :label="$t('general.name')"
              :rules="rules.name"
              :placeholder="$t('pim.enter_contact_name')"
              required
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.relationship"
              :label="$t('pim.relationship')"
              :rules="rules.relationship"
              :placeholder="$t('pim.enter_relationship')"
              required
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.priority"
              type="select"
              :label="$t('pim.priority')"
              :options="priorityOptions"
              :placeholder="$t('pim.select_priority')"
            />
          </oxd-grid-item>
        </oxd-grid>
      </oxd-form-row>

      <!-- Contact Information Section -->
      <oxd-text class="orangehrm-sub-title" tag="h6">
        {{ $t('pim.contact_information') }}
      </oxd-text>
      <oxd-divider />
      
      <oxd-form-row>
        <oxd-grid :cols="3" class="orangehrm-full-width-grid">
          <oxd-grid-item>
            <oxd-input-field
              v-model.trim="contact.homePhone"
              :label="$t('pim.home_telephone')"
              :rules="rules.homePhone"
              :placeholder="$t('pim.enter_home_telephone')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model.trim="contact.mobilePhone"
              :label="$t('general.mobile')"
              :rules="rules.mobilePhone"
              :placeholder="$t('pim.enter_mobile')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model.trim="contact.officePhone"
              :label="$t('pim.work_telephone')"
              :rules="rules.officePhone"
              :placeholder="$t('pim.enter_work_telephone')"
            />
          </oxd-grid-item>
        </oxd-grid>
      </oxd-form-row>

      <!-- Additional Contact Information -->
      <oxd-form-row>
        <oxd-grid :cols="3" class="orangehrm-full-width-grid">
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.email"
              :label="$t('general.email')"
              :rules="rules.email"
              :placeholder="$t('pim.enter_email')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.address"
              :label="$t('pim.address')"
              :rules="rules.address"
              :placeholder="$t('pim.enter_address')"
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
        </oxd-grid>
      </oxd-form-row>

      <!-- University-specific Information -->
      <oxd-text class="orangehrm-sub-title" tag="h6">
        {{ $t('pim.university_information') }}
      </oxd-text>
      <oxd-divider />
      
      <oxd-form-row>
        <oxd-grid :cols="3" class="orangehrm-full-width-grid">
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.department"
              :label="$t('pim.department')"
              :rules="rules.department"
              :placeholder="$t('pim.enter_department')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.faculty"
              :label="$t('pim.faculty')"
              :rules="rules.faculty"
              :placeholder="$t('pim.enter_faculty')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.campus"
              :label="$t('pim.campus')"
              :rules="rules.campus"
              :placeholder="$t('pim.enter_campus')"
            />
          </oxd-grid-item>
        </oxd-grid>
      </oxd-form-row>

      <!-- Additional Information -->
      <oxd-text class="orangehrm-sub-title" tag="h6">
        {{ $t('pim.additional_information') }}
      </oxd-text>
      <oxd-divider />
      
      <oxd-form-row>
        <oxd-grid :cols="3" class="orangehrm-full-width-grid">
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.notes"
              type="textarea"
              :label="$t('pim.notes')"
              :rules="rules.notes"
              :placeholder="$t('pim.enter_notes')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.isActive"
              type="checkbox"
              :label="$t('pim.active')"
              :option-label="$t('general.yes')"
            />
          </oxd-grid-item>
          <oxd-grid-item>
            <oxd-input-field
              v-model="contact.isPrimary"
              type="checkbox"
              :label="$t('pim.primary_contact')"
              :option-label="$t('general.yes')"
            />
          </oxd-grid-item>
        </oxd-grid>
      </oxd-form-row>

      <oxd-form-actions>
        <required-text />
        <oxd-button
          type="button"
          display-type="ghost"
          :label="$t('general.cancel')"
          @click="onCancel"
        />
        <submit-button />
      </oxd-form-actions>
    </oxd-form>
  </div>
  <oxd-divider />
</template>

<script>
import {
  required,
  shouldNotExceedCharLength,
  validPhoneNumberFormat,
  validEmailFormat,
} from '@ohrm/core/util/validation/rules';

const emergencyContactModel = {
  name: '',
  relationship: '',
  homePhone: '',
  officePhone: '',
  mobilePhone: '',
  email: '',
  address: '',
  city: '',
  department: '',
  faculty: '',
  campus: '',
  notes: '',
  priority: '',
  isActive: true,
  isPrimary: false,
};

export default {
  name: 'EditEmergencyContact',

  props: {
    http: {
      type: Object,
      required: true,
    },
    data: {
      type: Object,
      required: true,
    },
  },

  emits: ['close'],

  data() {
    return {
      isLoading: false,
      contact: {...emergencyContactModel},
      rules: {
        name: [required, shouldNotExceedCharLength(100)],
        relationship: [required, shouldNotExceedCharLength(100)],
        homePhone: [
          validPhoneNumberFormat,
          shouldNotExceedCharLength(30),
          (v) => {
            return (
              v !== '' ||
              this.contact.mobilePhone !== '' ||
              this.contact.officePhone !== '' ||
              this.$t('pim.at_least_one_phone_number_is_required')
            );
          },
        ],
        mobilePhone: [validPhoneNumberFormat, shouldNotExceedCharLength(30)],
        officePhone: [validPhoneNumberFormat, shouldNotExceedCharLength(30)],
        email: [validEmailFormat, shouldNotExceedCharLength(100)],
        address: [shouldNotExceedCharLength(200)],
        city: [shouldNotExceedCharLength(100)],
        department: [shouldNotExceedCharLength(100)],
        faculty: [shouldNotExceedCharLength(100)],
        campus: [shouldNotExceedCharLength(100)],
        notes: [shouldNotExceedCharLength(500)],
        priority: [shouldNotExceedCharLength(20)],
      },
      priorityOptions: [
        {id: 'High', label: this.$t('pim.high')},
        {id: 'Medium', label: this.$t('pim.medium')},
        {id: 'Low', label: this.$t('pim.low')},
      ],
    };
  },

  beforeMount() {
    this.isLoading = true;
    this.http
      .get(this.data.id)
      .then((response) => {
        const {data} = response.data;
        this.contact = {...emergencyContactModel, ...data};
        this.contact.priority = this.priorityOptions.find(
          (item) => item.id === data.priority,
        );
      })
      .finally(() => {
        this.isLoading = false;
      });
  },

  methods: {
    onSave() {
      this.isLoading = true;
      this.http
        .update(this.data.id, {
          ...this.contact,
          priority: this.contact.priority?.id,
        })
        .then(() => {
          return this.$toast.updateSuccess();
        })
        .then(() => {
          this.contact = {...emergencyContactModel};
          this.onCancel();
        });
    },
    onCancel() {
      this.$emit('close', true);
    },
  },
};
</script>
