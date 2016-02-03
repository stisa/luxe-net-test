Luxe Net Test
=============

This is a small example of a multiplayer game, using node.js as the game server
and [luxe](https://github.com/underscorediscovery/luxe) as client.  
Currently it's based on websockets, and it only works in the browser. I plan to
add at least android as a target in the future.
There's a playable demo at [my site](http://stisa.space/luxe-net-test).

Controls
--------
Move: `W` `A` `S` `D`  
Remove sprite: `R`

Test locally
------------
I assume you already have git, node.js and luxe installed properly.

Clone this repo:
```git  
git clone https://github.com/stisa/luxe-net-test.git
```
Go to the node_server folder:
```
cd luxe-net-test/node_server
```
Install the server ( it's just [ws](https://github.com/websockets/ws), to support websockets in node):
```
npm install
```
Start the server:
```
node server.js
```

Now make sure `defines: ['heroku']` is commented out in `project.flow`.
Open a terminal in `luxe-net-test` and run the project:
```
flow run web
```

Run the project multiple times and move the sprites around, the position of the
sprites should be the same in all windows.
