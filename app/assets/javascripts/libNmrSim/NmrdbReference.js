import React from 'react';

const ViewAtNmrdb = ({ is13C, smile }) => {
  const nmrdbLink = is13C
          ? `http://www.nmrdb.org/service.php?name=nmr-13c-prediction&smiles=${smile}`
          : `http://www.nmrdb.org/service.php?name=nmr-1h-prediction&smiles=${smile}`;
  return (
    <div className="nmr-icon">
      <i>View directly on </i>
      <a target="_blank" href={nmrdbLink} className="nmr-icon-border">
        <img src="https://www.nmrdb.org/images/logo.jpg" alt="" width="80" />
      </a>
    </div>
  );
};

const LinkToNmrdb = () => {
  return (
    <div>
      <i>Powered by <img src="https://www.nmrdb.org/images/logo.jpg" alt="" width="80" /></i>
      <br />
      <h5>References</h5>
        <p>Banfi, D.; Patiny, L. <a target="_blank" href="https://www.ingentaconnect.com/content/scs/chimia/2008/00000062/00000004/art00022?token=00591c19bba3993e5ad37e41225f4038382c49416648773b62442e576b34272c5f7b3d6d3f4e4b341db3555ce">www.nmrdb.org: Resurrecting and processing NMR spectra on-line Chimia</a>, 2008, 62(4), 280-281.</p>
        <p>Andrés M. Castillo, Luc Patiny and Julien Wist. <a target="_blank" href="https://www.sciencedirect.com/science/article/pii/S1090780710004003">Fast and Accurate Algorithm for the Simulation of NMR spectra of Large Spin Systems</a>. J of Magnetic Resonance 2011.</p>
        <p>Aires-de-Sousa, M. Hemmer, J. Gasteiger, <a target="_blank" href="https://pubs.acs.org/doi/abs/10.1021/ac010737m">"Prediction of 1H NMR Chemical Shifts Using Neural Networks"</a>, Analytical Chemistry, 2002, 74(1), 80-90.</p>
        <p>Steinbeck, Christoph, Stefan Krause, and Stefan Kuhn, <a target="_blank" href="https://pubs.acs.org/doi/abs/10.1021/ci0341363">"NMRShiftDB Constructing a Free Chemical Information System with Open-Source Components"</a>, J of chemical information and computer sciences, 2003, 43(6): 1733-1739.</p>
    </div>
  );
};

export { ViewAtNmrdb, LinkToNmrdb };

ViewAtNmrdb.propTypes = {
  is13C: React.PropTypes.string,
  smile: React.PropTypes.string,
};
