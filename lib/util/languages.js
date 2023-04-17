const blanksFilter = item => {
  const text = item.textContent.trim();
  const int = parseInt(text[0]);
  return !(isNaN(int) && text.length === 1);
};

class JDoodleLanguage {
  name;
  code;
  versions = [];
  constructor(name) {this.name = name}
}

let spans = document.getElementsByTagName("span");
let languageDataSets = [[]];
let languageCodes = [];
let languages = [new JDoodleLanguage(spans[0])];
spans = Array.from(spans);
spans = spans.filter(blanksFilter);
let lastType;
for (let child of spans) {
  let type;
  const text = child.textContent.trim();
  const int = parseInt(text[0]);

  if ((isNaN(int) && text.length > 1 && text[0].toLowerCase() === text[0]) || text.toLowerCase() === "c") {
    type = "languageCode";
  } else if (isNaN(int) && text.length > 1 && !text.includes(".")) {
    type = "language";
  } else if (!isNaN(int) && text.length === 1) {
    type = "versionIndex";
  } else {
    type = "version";
  }
  if (lastType === "versionIndex" && type === "language") {
    console.log("end of language set");
    languageDataSets.push([text]);
    languages.push(new JDoodleLanguage(text));
  } else {
    let currGroupIndex1 = languageDataSets.length - 1;
    let currGroupIndex = languages.length - 1;
    languageDataSets[currGroupIndex1].push(text);
    if (type === "languageCode") languages[currGroupIndex].code = text;
    else if (type === "version") languages[currGroupIndex].versions.push(text);
  }
  console.log(`text ${text} is ${type}`);

  if(type === "languageCode") {languageCodes.push(text)}

  lastType = type;
}
languageDataSets = languageDataSets.map(s => s.filter((_, i) => i % 2 === 0));
for(language of languages) {
  console.log(`
  final ${language.code} = JdoodleLanguage(
    name: '${language.name}',
    code: '${language.code}',
    versions: [${language.versions.map(v=>`'${v}'`)}
    ],
  );`)
}
languageCodes = languageCodes.filter((_, i) => i % 2 === 0)
let string = '['
for (name of languageCodes) {
  string = `${string} ${name},`;
}

console.log(string)