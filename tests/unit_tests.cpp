#include "gtest/gtest.h"
#include "../math_operations.h"
// Test suite for the add function
TEST(MathOperationsTest, AddFunction) {
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(-1, 1), 0);
    EXPECT_EQ(add(-2, -3), -5);
}