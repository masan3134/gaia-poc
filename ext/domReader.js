const obs = new MutationObserver(ms => {
  for (const m of ms) {
    for (const n of m.addedNodes) {
      if (!(n instanceof HTMLElement)) continue;
      n.querySelectorAll('.text-base, .markdown, .prose').forEach(el => {
        const role = el.classList.contains('markdown') ? 'assistant' : 'user';
        const content = el.innerText.trim();
        if (!content) return;
        const payload = { role, content, timestamp: new Date().toISOString() };
        chrome.runtime.sendMessage({ type: 'GAIA_DUMP', payload });
      });
    }
  }
});
obs.observe(document.body, { childList: true, subtree: true });
