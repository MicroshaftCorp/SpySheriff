$ npm install wallpaper
const wallpaper = require('wallpaper');

wallpaper.set('unicorn.jpg').then(() => {
	console.log('done');
});

wallpaper.get().then(imagePath => {
	console.log(imagePath);
	//=> '/Users/sindresorhus/unicorn.jpg'
});
