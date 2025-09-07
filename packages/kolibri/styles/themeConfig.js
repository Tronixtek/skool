import Vue from 'vue';

const themeConfig = Vue.observable({
  appBar: {
    background: '#4A90E2', // Primary Blue
    textColor: '#F5F9FC', // Neutral Light
    topLogo: {
      src: null,
      alt: null,
      style: null,
    },
  },
  signIn: {
    topLogo: {
      src: null,
      alt: null,
      style: null,
    },
    title: 'VT_SKOOL',
    showTitle: true,
    titleStyle: { color: '#2C3E50' }, // Dark Accent
    showPoweredBy: null,
    poweredByStyle: null,
    showKolibriFooterLogo: null,
    background: '#A9D2F5', // Soft Blue
  },
  sideNav: {
    topLogo: {
      src: null,
      alt: null,
      style: null,
    },
    title: 'VT_SKOOL',
    brandedFooter: {},
    showKFooterLogo: true,
    background: '#F5F9FC', // Neutral Light
    textColor: '#2C3E50', // Dark Accent
  },
});

export default themeConfig;
