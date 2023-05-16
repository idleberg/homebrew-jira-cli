import { extract } from '@extractus/feed-extractor';
import download from 'download';
import ejs from 'ejs';
import { promises as fs } from 'node:fs';
import hasha from 'hasha';
import path from 'node:path';
import os from 'node:os';
import semVerCompare from 'semantic-compare';
import { time } from 'node:console';

async function main() {
	console.log(/* let it breathe */);

	const releases = await getReleases();
	const versions = getVersions(releases);
	const latestVersion = getLatest(versions);
	const checksum = await getHash(latestVersion);

	await updateCask({
		checksum,
		version: latestVersion
	});
}

await main();

async function getReleases() {
	let releases;

	try {
		console.time('Downloading feed');
		releases = await extract('https://github.com/ankitpokhrel/jira-cli/releases.atom');
		console.timeEnd('Downloading feed');

	} catch (error) {
		console.error(logSymbols.error, error.message);
		process.exit(1);
	}

	return releases;
}

function getVersions(releases) {
	return releases.entries.map(item => item.title);
}

function getLatest(versions) {
	const latest = versions.sort(semVerCompare).at(-1);

	return latest.startsWith('v')
		? latest.replace(/^v/, '')
		: latest;
}

async function getHash(version) {
	const fileName = `jira_${version}_macOS_x86_64.tar.gz`;
	const filePath = path.resolve(os.tmpdir(), fileName);
	const url = `https://github.com/ankitpokhrel/jira-cli/releases/download/v${version}/${fileName}`;

	console.time(`Downloading v${version}`);
	await download(url, os.tmpdir());
	console.timeEnd(`Downloading v${version}`);

	console.time(`Calculating checksum`);
	const hash = await hasha.fromFile(filePath, {
		algorithm: 'sha256'
	});
	console.timeEnd(`Calculating checksum`);

	return hash;
}

async function updateCask(data) {
	console.time('Updating cask file');

	const template = await fs.readFile('src/template.ejs', {
		encoding: 'utf-8'
	});

	const caskFile = await ejs.render(template, data, {
		async: true
	});

	await fs.writeFile('Cask/jira-cli.rb', caskFile, {
		encoding: 'utf-8'
	});

	console.timeEnd('Updating cask file');
}
