#include <iostream>
#include <vector>
#include <cstdint>
#define BACKEND_OBFU
class TEA {
public:
    TEA(const std::vector<uint32_t>& key) {
        for (int i = 0; i < 4; ++i) {
            this->key[i] = key[i];
        }
    }
	__attribute((__annotate__(("flatten,boguscfg,substitution"))))
    void encrypt(uint32_t& v0, uint32_t& v1) const {
    #ifdef BACKEND_OBFU
    	asm("backend-obfu");
	#endif 
        uint32_t sum = 0;
        uint32_t delta = 0x9e3779b9;
        for (int i = 0; i < 32; ++i) {
            sum += delta;
            v0 += ((v1 << 4) + key[0]) ^ (v1 + sum) ^ ((v1 >> 5) + key[1]);
            v1 += ((v0 << 4) + key[2]) ^ (v0 + sum) ^ ((v0 >> 5) + key[3]);
        }
    }

    void decrypt(uint32_t& v0, uint32_t& v1) const {
        uint32_t sum = 0xC6EF3720;
        uint32_t delta = 0x9e3779b9;
        for (int i = 0; i < 32; ++i) {
            v1 -= ((v0 << 4) + key[2]) ^ (v0 + sum) ^ ((v0 >> 5) + key[3]);
            v0 -= ((v1 << 4) + key[0]) ^ (v1 + sum) ^ ((v1 >> 5) + key[1]);
            sum -= delta;
        }
    }

private:
    uint32_t key[4];
};

int main() {
    std::vector<uint32_t> key = {0x01234567, 0x89abcdef, 0xfedcba98, 0x76543210};
    TEA tea(key);

    uint32_t v0 = 0x12345678;
    uint32_t v1 = 0x9abcdef0;

    std::cout << "Original: " << std::hex << v0 << " " << v1 << std::endl;

    tea.encrypt(v0, v1);
    std::cout << "Encrypted: " << std::hex << v0 << " " << v1 << std::endl;

    tea.decrypt(v0, v1);
    std::cout << "Decrypted: " << std::hex << v0 << " " << v1 << std::endl;

    return 0;
}

