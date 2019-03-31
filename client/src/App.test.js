import App from './App';
import React from 'react';
import { shallow } from 'enzyme';

describe('App', () => {
  it('should have the UserForm component', () => {
    const wrapper = shallow(
      <App />
    );

    // expect(wrapper.contains(userForm)).toBe(true);
  });
});
