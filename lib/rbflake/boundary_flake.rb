require 'macaddr'
module Rbflake

    class BoundaryFlake
        TS_WITDTH = 64
        GEN_ID_WIDTH = 48
        SEQ_WIDTH = 16

        def initialize
            @seq = 0
            @mac = mac_addr
        end

        def now_millis
            Time.now.strftime("%s%L").to_i
        end

        def mac_addr
            Mac.addr.split(":").map{|m|  "%08d" % m.to_i(16).to_s(2)}.join.to_i(2)
        end

        def generate
            ts = now_millis
            mac = @mac
            seq = generate_sequence(ts)
            generate_id(ts, mac, seq)
        end

        def generate_id(ts, mac, seq)
            ts = ts << (GEN_ID_WIDTH + SEQ_WIDTH)
            mac = mac << SEQ_WIDTH
            seq = seq % (1 << SEQ_WIDTH)
            ts + mac + seq
        end

        def generate_sequence(ts)
            @seq += 1
            @seq = 0 if ts != @ts
            @ts = ts
            @seq
        end

        def generate_times(times_count)
            times_count.times.map{generate}
        end

    end
end
