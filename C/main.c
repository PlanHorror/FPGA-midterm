#include <stdio.h>
#include <stdint.h>

#define student_id   0x22110173 // Mã Số Sinh Viên
#define birth_date   0x12082004 // Ngày Tháng Năm Sinh
#define birth_day    12          // Ngày Sinh
#define birth_month  8          // Tháng Sinh

void hash_function(uint32_t state[4], uint32_t round) {
    for (uint32_t i = 0; i < round; ++i) {
        if (i == 0) {
            state[0] = state[1] ^ student_id;
            state[1] = state[2] | state[3];
            state[2] = state[3] & birth_date;
            state[3] = state[0] + state[1];
        }
        else {
            state[0] = (state[0] + state[1]) ^ (state[2] - state[3]);
            state[1] = (~state[0] & student_id) | ((state[3]) ^ i);
            state[2] = (state[2] ^ student_id) - (state[1] >> i);
            state[3] = (state[3] << i) ^ (birth_date + state[2]);
        }printf("Round %d: %08x %08x %08x %08x\n", i, state[0], state[1], state[2], state[3]);
    }
}

int main() {
    uint32_t round = birth_day | birth_month;

    uint32_t state[4] = {0xdeadbeef, 0xcafebabe, 0xfaceb00c, 0xbadc0dde};
    printf("Initial State: %08x %08x %08x %08x\n", state[0], state[1], state[2], state[3]);

    hash_function(state, round);

    printf("Output: %08x %08x %08x %08x\n", state[0], state[1], state[2], state[3]);

    return 0;
}
