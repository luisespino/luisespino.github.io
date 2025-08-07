const repoOwner = "luisespino";  // <- Cambia por tu usuario si necesario
const repoName = "data-structures"; // <- Cambia por tu repo si necesario
const maxLanguages = 10;
const excludeLanguages = ["HTML"];

const languageColors = {
  JavaScript: "#f1e05a",
  Python: "#3572A5",
  Java: "#b07219",
  C: "#555555",
  "C++": "#f34b7d",
  Shell: "#89e051",
  HTML: "#e34c26",
  CSS: "#563d7c",
  Other: "#cccccc"
};

async function fetchLanguages() {
  try {
    const res = await fetch(`https://api.github.com/repos/${repoOwner}/${repoName}/languages`);
    if (!res.ok) throw new Error("❌ Error al obtener datos de GitHub");
    const data = await res.json();

    const total = Object.values(data).reduce((a, b) => a + b, 0);

    const filtered = Object.entries(data)
      .filter(([lang]) => !excludeLanguages.includes(lang))
      .sort((a, b) => b[1] - a[1])
      .slice(0, maxLanguages);

    const bar = document.getElementById("langBar");
    const legend = document.getElementById("legend");

    filtered.forEach(([lang, bytes]) => {
      const percent = ((bytes / total) * 100).toFixed(2);
      const color = languageColors[lang] || languageColors.Other;

      const segment = document.createElement("div");
      segment.className = "lang-segment";
      segment.style.width = percent + "%";
      segment.style.backgroundColor = color;
      bar.appendChild(segment);

      const label = document.createElement("div");
      label.innerHTML = `<strong style="color:${color}">■</strong> ${lang} – ${percent}%`;
      legend.appendChild(label);
    });
  } catch (error) {
    console.error(error.message);
  }
}

fetchLanguages();
