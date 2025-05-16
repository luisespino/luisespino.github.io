## Hi there 👋

I’m a Computer Science Engineer from the Universidad de San Carlos de Guatemala, and I hold a master’s degree in CS from the Instituto Tecnológico de Costa Rica. I’m passionate about programming and enjoy learning new technologies every day. I also work as a university professor, offering courses in Artificial Intelligence, Databases, Data Structures, Computer Architecture, Computer Networks, and Compilers.

![](http://github-profile-summary-cards.vercel.app/api/cards/repos-per-language?username=luisespino&theme=default) ![](http://github-profile-summary-cards.vercel.app/api/cards/stats?username=luisespino&theme=default) 

<h2>Sitios activos</h2>
<ul id="pages-sites"></ul>

<script>
  fetch('https://api.github.com/users/luisespino/repos')
    .then(res => res.json())
    .then(data => {
      const list = document.getElementById('pages-sites');
      data
        .filter(repo => repo.has_pages)
        .forEach(repo => {
          const li = document.createElement('li');
          li.innerHTML = `<a href="https://${repo.owner.login}.github.io/${repo.name}/">${repo.name}</a>`;
          list.appendChild(li);
        });
    });
</script>
