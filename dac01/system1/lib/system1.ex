# Alexandru Toma (ait15) and Andrei Isaila (ii515)

defmodule System1 do

  def main() do
    start_test3(true)
  end

  # Local tests
  # nr_of_peers = 5
  # max_broadcasts = 1000
  # timeout = 3000
  # Output:
  # 0: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # 2: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # 3: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # 4: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # 1: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  #
  # On Docker with 5 containers
  # container0                | 1: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # container0                | 2: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # container0                | 4: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # container0                | 3: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  # container0                | 0: [{1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}, {1000, 1000}]
  defp start_test1(is_local) do
    nr_of_peers = 5
    max_broadcasts = 1000
    timeout = 3000
    start(is_local, nr_of_peers, max_broadcasts, timeout)
  end

  # nr_of_peers = 5
  # max_broadcasts = 10_000_000
  # timeout = 3000
  # Output:
  # 1: [{93154, 87113}, {93154, 93153}, {93154, 146710}, {93154, 107294}, {93154, 53965}]
  # 4: [{53966, 87111}, {53966, 93151}, {53966, 146704}, {53966, 107292}, {53966, 53964}]
  # 2: [{146714, 87109}, {146714, 93149}, {146714, 146697}, {146714, 107284}, {146714, 53961}]
  # 3: [{107296, 87031}, {107296, 93072}, {107296, 146480}, {107296, 107147}, {107296, 53883}]
  # 0: [{87114, 87040}, {87114, 93081}, {87114, 146504}, {87114, 107166}, {87114, 53893}]
  #
  # On Docker with 5 containers
  # container0                | 1: [{23597, 2812}, {23597, 14742}, {23597, 3730}, {23597, 3449}, {23597, 4046}]
  # container0                | 0: [{26064, 19705}, {26064, 3222}, {26064, 7707}, {26064, 4093}, {26064, 4288}]
  # container0                | 4: [{18468, 20016}, {18468, 14729}, {18468, 17086}, {18468, 16692}, {18468, 16166}]
  # container0                | 3: [{24048, 2039}, {24048, 1393}, {24048, 7237}, {24048, 20124}, {24048, 2264}]
  # container0                | 2: [{26537, 14824}, {26537, 13261}, {26537, 26418}, {26537, 4550}, {26537, 12530}]
  defp start_test2(is_local) do
    nr_of_peers = 5
    max_broadcasts = 10_000_000
    timeout = 3000
    start(is_local, nr_of_peers, max_broadcasts, timeout)
  end


  # nr_of_peers = 10
  # max_broadcasts = 10_000_000
  # timeout = 3000
  # Output:
  # 7: [{16539, 18703}, {16539, 18633}, {16539, 13922}, {16539, 20474}, {16539, 18587}, {16539, 18249}, {16539, 12686}, {16539, 16536}, {16539, 11873}, {16539, 18227}]
  # 9: [{18229, 18703}, {18229, 18633}, {18229, 13922}, {18229, 20474}, {18229, 18587}, {18229, 18249}, {18229, 12687}, {18229, 16537}, {18229, 11874}, {18229, 18227}]
  # 6: [{12689, 18634}, {12689, 18565}, {12689, 13899}, {12689, 20405}, {12689, 18519}, {12689, 18228}, {12689, 12642}, {12689, 16469}, {12689, 11817}, {12689, 18207}]
  # 5: [{18251, 18633}, {18251, 18562}, {18251, 13898}, {18251, 20402}, {18251, 18517}, {18251, 18227}, {18251, 12640}, {18251, 16467}, {18251, 11816}, {18251, 18206}]
  # 4: [{18590, 18624}, {18590, 18553}, {18590, 13896}, {18590, 20395}, {18590, 18508}, {18590, 18225}, {18590, 12633}, {18590, 16458}, {18590, 11810}, {18590, 18204}]
  # 2: [{13924, 18705}, {13924, 18635}, {13924, 13924}, {13924, 20476}, {13924, 18589}, {13924, 18250}, {13924, 12688}, {13924, 16539}, {13924, 11876}, {13924, 18228}]
  # 8: [{11877, 18704}, {11877, 18633}, {11877, 13922}, {11877, 20475}, {11877, 18588}, {11877, 18249}, {11877, 12687}, {11877, 16537}, {11877, 11875}, {11877, 18227}]
  # 0: [{18706, 18705}, {18706, 18635}, {18706, 13924}, {18706, 20476}, {18706, 18589}, {18706, 18251}, {18706, 12688}, {18706, 16539}, {18706, 11876}, {18706, 18228}]
  # 3: [{20477, 18705}, {20477, 18634}, {20477, 13923}, {20477, 20476}, {20477, 18589}, {20477, 18250}, {20477, 12688}, {20477, 16538}, {20477, 11876}, {20477, 18228}]
  # 1: [{18636, 18705}, {18636, 18635}, {18636, 13924}, {18636, 20476}, {18636, 18589}, {18636, 18250}, {18636, 12688}, {18636, 16539}, {18636, 11876}, {18636, 18228}]
  #
  # On Docker with 5 containers
  # container0                |
  # container0                | 19:43:01.036 [warn]  ** Can not start PeerSystem1::start,[5] on :"node6@container6.localdomain" **
  # container0                |
  # container0                |
  # container0                | 19:43:01.036 [warn]  ** Can not start PeerSystem1::start,[6] on :"node7@container7.localdomain" **
  # container0                |
  # container0                |
  # container0                | 19:43:01.036 [warn]  ** Can not start PeerSystem1::start,'\a' on :"node8@container8.localdomain" **
  # container0                |
  # container0                |
  # container0                | 19:43:01.036 [warn]  ** Can not start PeerSystem1::start,'\b' on :"node9@container9.localdomain" **
  # container0                |
  # container0                |
  # container0                | 19:43:01.036 [warn]  ** Can not start PeerSystem1::start,'\t' on :"node10@container10.localdomain" **
  # container0                |
  # container0                | 0: [{7912, 6965}, {7912, 5127}, {7912, 8546}, {7912, 5465}, {7912, 5479}, {7912, 0}, {7912, 0}, {7912, 0}, {7912, 0}, {7912, 0}]
  # container0                | 1: [{7414, 4649}, {7414, 4467}, {7414, 4470}, {7414, 4199}, {7414, 4002}, {7414, 0}, {7414, 0}, {7414, 0}, {7414, 0}, {7414, 0}]
  # container0                | 2: [{10626, 6648}, {10626, 6016}, {10626, 8733}, {10626, 5796}, {10626, 5109}, {10626, 0}, {10626, 0}, {10626, 0}, {10626, 0}, {10626, 0}]
  # container0                | 3: [{7225, 7377}, {7225, 7003}, {7225, 9550}, {7225, 6664}, {7225, 5717}, {7225, 0}, {7225, 0}, {7225, 0}, {7225, 0}, {7225, 0}]
  # container0                | 4: [{7446, 7912}, {7446, 6856}, {7446, 9147}, {7446, 7124}, {7446, 7446}, {7446, 0}, {7446, 0}, {7446, 0}, {7446, 0}, {7446, 0}]
  defp start_test3(is_local) do
    nr_of_peers = 10
    max_broadcasts = 10_000_000
    timeout = 3000
    start(is_local, nr_of_peers, max_broadcasts, timeout)
  end

  def start(is_local, nr_of_peers, max_broadcasts, timeout) do
    IO.puts "Starting #{if is_local do "local" else "on docker" end} with nr_of_peers: #{nr_of_peers}, max_broadcasts: #{max_broadcasts}, timeout: #{timeout}"
    IO.puts ""

    peers = for i <- 1..nr_of_peers do
      if is_local do
        spawn(Peer, :start, [i-1])
      else
        Node.spawn(:'node#{i}@container#{i}.localdomain', Peer, :start, [i-1])
      end
    end

    for p <- peers do
      send p, {:bind, peers}
    end

    for p <- peers do
      send p, {:broadcast, max_broadcasts, timeout}
    end
  end

end
