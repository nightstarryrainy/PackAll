import js.lib.webassembly.Module;
import electron.main.Dialog;
import electron.Shell;
import electron.main.Menu;
import electron.main.MenuItem;
import electron.main.App;
import electron.main.BrowserWindow;
import js.Node.process;

class Main {
	static var openDefaultPath:String = "C://";

	static function main() {
		Sys.println(process.platform + ' ' + process.arch);
		Sys.println('node ' + process.version);
		Sys.println('electron ' + process.versions['electron']);

		electron.main.App.whenReady().then(_ -> {
			var win = new BrowserWindow({
				width: 720,
				height: 480,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
				}
			});
			win.on(closed, () -> {
				win = null;
			});
			win.loadFile('app.html');
			// win.webContents.openDevTools();
			var menu:electron.main.Menu = electron.main.Menu.getApplicationMenu();
			menu.append(new electron.main.MenuItem({
				label: 'Haxe',
				submenu: [
					{label: 'Website', click: e -> win.loadURL('https://haxe.org')},
					{label: 'Github', click: e -> win.loadURL('https://github.com/HaxeFoundation')}
				]
			}));
			menu.append(new electron.main.MenuItem({
				label: "Extra",
				submenu: [
					{
						label: "Dev Console",
						click: e -> {
							if (win.webContents.isDevToolsOpened())
								win.webContents.closeDevTools();
							else
								win.webContents.openDevTools();
						}
					}
				]
			}));

			for (item in menu.items) {
				if (item.label == "File") {
					var fileMenuItem:MenuItem = item;
					fileMenuItem.submenu.insert(0,new MenuItem({
						label: "Open",
						click: (m, b, e) -> {
							var path = Dialog.showOpenDialogSync({
								{
									defaultPath: openDefaultPath,
									properties: ["openFile", "openDirectory"]
								}
							});
							if(path!= null){
								var m = new Module(path);
							}
						},
					}));
					break;
				}
			}

			electron.main.Menu.setApplicationMenu(menu);
		});

		electron.main.App.on(window_all_closed, e -> {
			if (process.platform != 'darwin')
				electron.main.App.quit();
		});
	}
}
