const port = chrome.runtime.connect({ name: 'gaia-panel' });
port.onMessage.addListener(payload => {
  window.postMessage({ type: 'GAIA_DUMP', payload }, '*');
});
