var http = require('http');

// console.log(process) // similar to phpinfo();
const [major, minor, patch] = process.versions.node.split('.').map(Number);
console.log(`Node.js version: ${major}.${minor}.${patch}`);

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('Hello World!');
}).listen(3000, null, () => {
    console.log('Server running at http://localhost:3000/');
} );