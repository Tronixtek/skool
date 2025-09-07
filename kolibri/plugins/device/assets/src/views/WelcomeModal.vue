<template>

  <KModal
    title="Welcome to VT_SKOOL Portal!"
    :submitText="coreString('continueAction')"
    @submit="$emit('submit')"
  >
    <p class="paragraph">
      There is nothing in your library yet. Explore libraries around you and start adding materials to your own.
    </p>
  </KModal>

</template>


<script>

  import commonCoreStrings from 'kolibri/uiText/commonCoreStrings';
  import useUser from 'kolibri/composables/useUser';
  import useFacilities from 'kolibri-common/composables/useFacilities';

  export default {
    name: 'WelcomeModal',
    mixins: [commonCoreStrings],
    setup() {
      const { isLearnerOnlyImport } = useUser();
      const { facilities } = useFacilities();
      return { isLearnerOnlyImport, facilities };
    },
    props: {
      importedFacility: {
        type: Object,
        default: null,
      },
      isOnMyOwnUser: {
        type: Boolean,
        required: false,
        default: false,
      },
    },
    // paragraphs logic removed, hardcoded modal content

    render: createElement => window.setTimeout(createElement, 750),
    $trs: {
      welcomeModalHeader: {
        message: 'Welcome to VT_SKOOL Portal!',
        context: 'Title of welcome window which displays on first sign in as a super admin.',
      },
      welcomeModalContentDescription: {
        message: 'There is nothing in your library yet. Explore libraries around you and start adding materials to your own.',
        context: 'Message shown when the library is empty.',
      },
      welcomeModalPermissionsDescription: {
        message:
          'The super admin account you created during setup has special permissions to do this. Learn more in the Permissions tab later.',
        context:
          'Text that appears on welcome window when a super admin sets up a facility for the first time.\n',
      },
      postSyncWelcomeMessage1: {
        message: 'The first thing you should do is import some channels to this device.',
        context:
          "Welcome message for user which appears if there are no channels on the device. This is similar to the 'The first thing you should do is import some resources from the Channels tab' string.",
      },
      postSyncWelcomeMessage2: {
        message: `The learner reports, lessons, and quizzes in '{facilityName}' will not display properly until you import the resources associated with them.`,
        context: 'Welcome message for user indicating that they need to import resources.',
      },
      learnOnlyDeviceWelcomeMessage1: {
        message: 'The first thing you should do is import some channels to this device',
        context:
          "Welcome message for user which appears after provisioning a Learner Only Device.\n\nThis is similar to the 'The first thing you should do is import some resources from the Channels tab' string.",
      },
      learnOnlyDeviceWelcomeMessage2: {
        message: `The user reports, lessons, and quizzes will not display properly until you import the resources associated with them.`,
        context: 'Welcome message for user indicating that they need to import resources.',
      },
    },
  };

</script>


<style lang="scss" scoped>

  .paragraph {
    margin-top: 16px;
  }

</style>
