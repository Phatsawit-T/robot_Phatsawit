class customlib:

    def caesar_decrypt(self, encrypted, k):
        """
        Decrypt Caesar cipher by shifting alphabet backwards

        Args:
            encrypted (str): Encrypted text (e.g., 'VTAOG')
            k (int): Shift value (e.g., 2)

        Returns:
            str: Decrypted text (e.g., 'TRYME')

        Example:
            | ${result} | Caesar Decrypt | VTAOG | 2 |
            | Should Be Equal | ${result} | TRYME |
        """
        decrypted = ""
        k = int(k)  # Ensure k is integer

        for char in encrypted:
            if char.isupper():
                # Shift backwards for uppercase letters (A-Z)
                shifted = ord(char) - k
                if shifted < ord('A'):
                    shifted += 26
                decrypted += chr(shifted)
            elif char.islower():
                # Shift backwards for lowercase letters (a-z)
                shifted = ord(char) - k
                if shifted < ord('a'):
                    shifted += 26
                decrypted += chr(shifted)
            else:
                # Keep non-alphabetic characters unchanged
                decrypted += char

        return decrypted
