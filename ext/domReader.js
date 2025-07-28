const obs = new MutationObserver(ms => {
  ms.forEach(m => [...m.addedNodes].forEach(n => {
    if (!(n instanceof HTMLElement)) return;
    const msgs = n.querySelectorAll('.text-base, .markdown, .prose');
    msgs.forEach(el => {
      const role = el.classList.contains('markdown')? 'assistant':'user';
      const content = el.innerText.trim();
      if (!content) return;
      window.postMessage({ type:'GAIA_DUMP', payload:{ role, content, timestamp:new Date().toISOString() }}, '*');
    });
  }));
});
obs.observe(document.body,{ childList:true, subtree:true });
