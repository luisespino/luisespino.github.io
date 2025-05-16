---
layout: default
---

{% include_relative README.md %}

<h2>Active Repositories</h2>
<ul id="pages-sites"></ul>

<script>
  const reposAExcluir = ['luisespino.github.io', 'test'];

  fetch('https://api.github.com/users/luisespino/repos')
    .then(res => res.json())
    .then(data => {
      const list = document.getElementById('pages-sites');
      data
        .filter(repo => repo.has_pages && !reposAExcluir.includes(repo.name))
        .forEach(repo => {
          const li = document.createElement('li');
          li.innerHTML = `<a href="https://${repo.owner.login}.github.io/${repo.name}/">${repo.name}</a>`;
          list.appendChild(li);
        });
    });
</script>

<a href="https://github.com/luisespino/linux-handbook" class="github-corner" aria-label="View source on GitHub">
  <svg width="80" height="80" viewBox="0 0 250 250"
       style="fill:#151513; color:#fff; position: absolute; top: 0; border: 0; right: 0;"
       aria-hidden="true">
    <path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path>
    <path d="M128.3,109.0 ..." fill="currentColor" class="octo-arm"></path>
    <path d="M115.0,115.0 ..." fill="currentColor" class="octo-body"></path>
  </svg>
</a>
