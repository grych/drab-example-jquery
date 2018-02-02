This is an example Phoenix project with Drab installed. For info, please visit [Drab Project Page](https://github.com/grych/drab)

### Requirements

* Elixir 1.4
* Phoenix 1.2

### Installation

* Clone the package
* mix deps.get
* npm install && node_modules/brunch/bin/brunch build 

### Testing Drab Functions from IEx

* Run Phoenix in IEx:

      iex -S mix phoenix.server

* Open the browser to http://localhost:4000

* After the page connects, you will get some debugging information in IEx console:

      [debug] 
          Started Drab for /, handling events in DrabExample.PageCommander
          You may debug Drab functions in IEx by copy/paste the following:
      import Drab.Core; import Drab.Query; import Drab.Modal; import Drab.Waiter
      socket = GenServer.call(pid("0.440.0"), :get_socket)

          Examples:
      socket |> select(:htmls, from: "h4")
      socket |> exec_js("alert('hello from IEx!')")
      socket |> alert("Title", "Sure?", buttons: [ok: "Azaliż", cancel: "Poniechaj"])

* Copy paste two lines as instructed:

      iex(2)> import Drab.Core; import Drab.Query; import Drab.Modal; import Drab.Waiter
      Drab.Waiter
      iex(3)> socket = GenServer.call(pid("0.440.0"), :get_socket)
      %Phoenix.Socket{assigns: %{__action: :index,
         __controller: DrabExample.PageController, __drab_pid: #PID<0.440.0>,
         __url_path: "/"}, channel: Drab.Channel, channel_pid: #PID<0.439.0>,
       endpoint: DrabExample.Endpoint, handler: DrabExample.UserSocket, id: nil,
       joined: true, pubsub_server: DrabExample.PubSub, ref: "28",
       serializer: Phoenix.Transports.WebSocketSerializer, topic: "__drab:/",
       transport: Phoenix.Transports.WebSocket, transport_name: :websocket,
       transport_pid: #PID<0.435.0>}

* Now you can remote control the browser with Drab functions:

Show JS alert box:

    iex(3)> socket |> exec_js("alert('hello from IEx!')") 
    nil

Get all href attributes:

    iex(4)> socket |> select(attrs: :href, from: "a")
    %{"__undefined_0" => "http://www.phoenixframework.org/docs",
      "__undefined_1" => "https://tg.pl/drab",
      "__undefined_2" => "http://phoenixframework.org/docs/overview",
      "__undefined_3" => "https://hexdocs.pm/phoenix",
      "__undefined_4" => "https://github.com/phoenixframework/phoenix",
      "__undefined_5" => "http://groups.google.com/group/phoenix-talk",
      "__undefined_6" => "http://webchat.freenode.net/?channels=elixir-lang",
      "__undefined_7" => "https://twitter.com/elixirphoenix"}

Run pretty Bootstrap Modal (please notice that IEx waits for your response):

    iex(5)> socket |> alert("Title", "Sure?", buttons: [ok: "Azaliż", cancel: "Poniechaj"])
    {:ok, %{}}
