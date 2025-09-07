import { createTranslator } from 'kolibri/utils/i18n';

// Taken from the PrivacyModal component in the facility plugin.
export const kdpNameTranslator = createTranslator('PrivacyModal', {
  syncToKDP: {
    message: 'VT_Skool Data Portal',
    context:
      'If the VT_Skool facility is part of a larger organization that tracks data on the VT_Skool Data Portal, the user receives a project token to sync the facility data with servers operated by Learning Equality in the cloud.',
  },
});
