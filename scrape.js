const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
    const url =  'https://www.example.com';  // Default to example.com if not set
    console.log('Scraping URL:', url);

    const browser = await puppeteer.launch({ executablePath: '/usr/bin/chromium',headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.goto(url);

    // Scrape data
    const scrapedData = await page.evaluate(() => {
        return {
            title: document.title,
            heading: document.querySelector('h1') ? document.querySelector('h1').innerText : 'No heading found',
        };
    });

    // Save scraped data to a file
    fs.writeFileSync('scraped_data.json', JSON.stringify(scrapedData, null, 2));
    await browser.close();
})();
