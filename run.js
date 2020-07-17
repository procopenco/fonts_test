console.log("test");

const puppeteer = require("puppeteer");
async function printPDF(input, output) {
  const browser = await puppeteer.launch({
    headless: true,
    args: ["--no-sandbox"],
  });
  const page = await browser.newPage();
  await page.goto(input, { waitUntil: "networkidle0" });
  const pdf = await page.pdf({ format: "A4", path: output });

  await browser.close();
  return pdf;
}

Promise.all([
  printPDF("file:///app/front_cover.svg", "/app/out.pdf"),
  printPDF("file:///app/front_cover_no_import.svg", "/app/out2.pdf"),
])
  .then(() => console.log("DONE"))
  .catch((err) => console.error(err));
