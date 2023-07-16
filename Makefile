CC = clang
FRAMEWORKS = -framework Foundation -framework DeviceCheck
CFLAGS = -v

token-generator: token-generator.m
	$(CC) $(FRAMEWORKS) $(CFLAGS) -o $@ $^
