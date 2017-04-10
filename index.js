
import { PropTypes } from 'react';
import { requireNativeComponent, View } from 'react-native';

var iface = {
  name: 'P41SketchView',
  propTypes: {
    ...View.propTypes // include the default view properties
  },
};

export default requireNativeComponent('P41SketchView', iface);