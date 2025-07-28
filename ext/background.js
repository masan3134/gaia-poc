const ports = [];
chrome.runtime.onConnect.addListener(port => {
  if (port.name === 'gaia-panel') {
    ports.push(port);
    port.onDisconnect.addListener(() => {
      const i = ports.indexOf(port);
      if (i >= 0) ports.splice(i, 1);
    });
  }
});
chrome.runtime.onMessage.addListener((msg, sender) => {
  if (msg.type === 'GAIA_DUMP') {
    for (const port of ports) {
      port.postMessage(msg.payload);
    }
  }
});
