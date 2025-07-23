# 🧮 Symmetric Row Sum – Assembly Program

## 📋 Description

This x86 16-bit Assembly program scans a 4×5 matrix and identifies **symmetric numbers** (e.g., 11, 22). When such numbers are found, it **sums the entire row** containing them and accumulates the total. The final result is printed using DOS interrupt `int 21h`.

If no symmetric numbers exist in the matrix, it prints a newline.

---

## 📐 Matrix Layout

```asm
arr db 1, 2, 3, 4, 5
    db 6, 7, 8, 9, 10
    db 11, 12, 13, 14, 15
    db 16, 17, 18, 19, 20
```

## ⚙️ How It Works

1. Loops through each row and column of the matrix using nested loops.
2. Checks each value with the `is_sym` procedure:
   - Reverses the number's digits.
   - Compares original vs. reversed.
   - If equal → it is symmetric.
3. If a symmetric number is found, the `sum_of` procedure calculates the sum of that entire row.
4. The result is added to a cumulative sum stored in `res`.
5. After processing the full matrix:
   - If at least one symmetric number was found → `res` is printed.
   - Else → prints a newline using `int 21h`.

## 🔧 Procedures

### `is_sym`

- Takes a number in `AL`.
- Reverses its digits.
- If reversed equals original → sets `AH = 1`.
- Otherwise sets `AH = 0`.

### `sum_of`

- Iterates over 5 elements of the current row.
- Adds each element to accumulator `AX`.
- Returns the sum.

### `print`

- Converts the integer in `res` to ASCII digits.
- Uses stack to reverse digits for correct printing order.
- Prints digits one by one via DOS interrupt `int 21h`.


## 🛠 Requirements

- Assembler: TASM, MASM, or compatible x86 16-bit assembler.
- Environment: DOSBox or any DOS-compatible emulator.

---

## 📤 Output

- Prints the sum of rows containing symmetric numbers.
- Prints a newline if no symmetric numbers found.
