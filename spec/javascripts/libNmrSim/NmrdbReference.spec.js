import React from 'react';
import expect from 'expect';
import { shallow } from 'enzyme';
import { ViewAtNmrdb, LinkToNmrdb } from '../../../app/assets/javascripts/libNmrSim/NmrdbReference';

const { describe, it } = global;

describe('ViewAtNmrdb', () => {
  it('should show the given text', () => {
    const text = 'View directly on';
    const wrapper = shallow(<ViewAtNmrdb />);
    expect(wrapper.text()).toInclude(text);
  });
});

describe('LinkToNmrdb', () => {
  it('should show the given text', () => {
    const text = 'References';
    const ref1 = 'Banfi, D.; Patiny, L. www.nmrdb.org: ' +
                  'Resurrecting and processing NMR spectra on-line Chimia, ' +
                  '2008, 62(4), 280-281.';
    const wrapper = shallow(<LinkToNmrdb />);
    expect(wrapper.text()).toInclude(text);
    expect(wrapper.text()).toInclude(ref1);
  });
});
