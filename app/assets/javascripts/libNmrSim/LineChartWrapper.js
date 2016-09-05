import React from 'react';
import ReactDOM from 'react-dom';
import { LineChart } from './LineChart';

export default class LineChartWrapper extends React.Component {
  componentDidMount() {
    LineChart.create({
      data: this.props.data,
      type: this.props.type,
      el: this.getDOMNode(),
    });
  }

  componentWillReceiveProps(nextProps) {
    LineChart.update({
      data: nextProps.data,
      type: nextProps.type,
      el: this.getDOMNode(),
    });
  }

  componentWillUnmount() {
    LineChart.destroy(this.getDOMNode());
  }

  getDOMNode() {
    return ReactDOM.findDOMNode(this);
  }

  render() {
    return (
      <div className="nmr-chart" />
    );
  }
}

LineChartWrapper.propTypes = {
  data: React.PropTypes.array,
  type: React.PropTypes.string,
};
