const repoOwner = "luisespino";
const repoName = "data-structures";
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
    if (!res.ok) throw new Error("Error al obtener datos de GitHub");
    const data = await res.json();

    const total = Object.values(data).reduce((a, b) => a + b, 0);
    const filtered = Object.entries(data)
      .filter(([lang]) => !excludeLanguages.includes(lang))
      .sort((a, b) => b[1] - a[1])
      .slice(0, maxLanguages);

    // Generar SVG
    let svg = `<svg width="600" height="140" viewBox="0 0 600 140" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="20" fill="#f0f0f0" rx="4" ry="4"/>`;

    // Barras de lenguaje
    let accumulated = 0;
    filtered.forEach(([lang, bytes]) => {
      const percent = (bytes / total) * 100;
      const color = languageColors[lang] || languageColors.Other;
      svg += `<rect x="${accumulated}%" width="${percent}%" height="20" fill="${color}" rx="4" ry="4"/>`;
      accumulated += percent;
    });

    // Leyenda
    svg += `<g transform="translate(0, 40)">`;
    filtered.forEach(([lang, bytes], i) => {
      const percent = ((bytes / total) * 100).toFixed(2);
      const color = languageColors[lang] || languageColors.Other;
      svg += `<text x="10" y="${i * 20 + 16}" fill="${color}" font-family="Arial" font-size="14">■ ${lang} – ${percent}%</text>`;
    });
    svg += `</g></svg>`;

    // Mostrar SVG en el contenedor
    document.getElementById("svg-container").innerHTML = svg;

    // Opcional: Convertir a PNG (si lo necesitas)
    // await convertToPNG(svg);
  } catch (error) {
    document.getElementById("svg-container").innerHTML = `<p>Error: ${error.message}</p>`;
  }
}

// Función opcional para convertir SVG a PNG (requiere canvas)
async function convertToPNG(svg) {
  const canvas = document.createElement("canvas");
  const ctx = canvas.getContext("2d");
  const img = new Image();

  img.onload = () => {
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);
    document.body.appendChild(canvas); // Mostrar PNG en lugar de SVG
  };

  const svgBlob = new Blob([svg], { type: "image/svg+xml" });
  img.src = URL.createObjectURL(svgBlob);
}

fetchLanguages();


/*
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
*/