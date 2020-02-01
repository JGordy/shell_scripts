COMPONENT=$1

COMPONENTPATH=$2tests/$COMPONENT

echo "import React from 'react';
import { shallow } from 'enzyme';

// Shared UI Components
import { $COMPONENT } from 'components/shared';

const defaultProps = {
    // ...props
};

const wrapper = shallow(<$COMPONENT {...defaultProps} />);

describe('<$COMPONENT />', () => {
    it('should render without crashing', () => {
        expect(wrapper.exists('.$COMPONENT')).toEqual(true);
    });
});" > $COMPONENTPATH'.spec.js'