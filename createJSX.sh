COMPONENT=$1

COMPONENTPATH=$2src/$COMPONENT

echo "import React from 'react';
import PropTypes from 'prop-types';
import '../styles/$COMPONENT.css';

const $COMPONENT = (props) => {

    // NOTE: To use state in a functional component, use React Hooks API
    // FIRST: replace the ''import React'' line with...
    // import React, { useState } from ''react'';

    // THEN: uncomment the next line:
    // const [ state, setState ] = useState('');

    // NOTE: for more information on how to use React Hooks, see the documentation
    // https://reactjs.org/docs/hooks-intro.html

    console.log('$COMPONENT -> props', props);

    return (
        <div className=\"$COMPONENT\">$COMPONENT</div>
    );
};

// TODO: Unless you need to use lifecycle methods,
// write your component in functional form as above and delete
// this section.
// NOTE: Now you can also use React Hooks for state in functional components, see comment above...
//
// class $COMPONENT extends React.Component {
//  constructor(props) {
//      super(props);
//
//      this.state = {
//        //  ...state
//      }
//  }
//
//   render() {
//     return <div className=\"$COMPONENT\">$COMPONENT</div>;
//   }
// }

$COMPONENT.propTypes = {
    /**
     * The classname to apply to the root node
     */
    classname: PropTypes.string.isRequired,
};

$COMPONENT.defaultProps = {
    className: '',
};

export default $COMPONENT;" > $COMPONENTPATH'.jsx'