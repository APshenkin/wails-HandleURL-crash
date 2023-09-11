package main

import "C"
import (
	"context"
	"fmt"
	"github.com/wailsapp/wails/v2/pkg/runtime"
)

var wailsContext *context.Context

// App struct
type App struct {
	ctx context.Context
}

// NewApp creates a new App application struct
func NewApp() *App {
	return &App{}
}

// startup is called when the app starts. The context is saved
// so we can call the runtime methods
func (a *App) startup(ctx context.Context) {
	a.ctx = ctx

	wailsContext = &ctx
}

// Greet returns a greeting for the given name
func (a *App) Greet(name string) string {
	return fmt.Sprintf("Hello %s, It's show time!", name)
}

//export HandleURL
func HandleURL(u *C.char) {
	labelText = C.GoString(u)

	runtime.EventsEmit(*wailsContext, "foo", labelText)

	println("labelText new", labelText)
}
