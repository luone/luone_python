#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import base64
import hashlib
import time


class Crypter(object):
    """Crtyter for esb auth."""

    def __init__(self):
        pass

    def generate_nonce(self, length=20):
        """Generate pseudo-random number."""
        #origin = ''.join([str(random.randint(0, 9)) for i in range(length)])
        origin_byte = os.urandom(length)
        return base64.b64encode(origin_byte).decode('ascii')

    def generate_timestamp(self):
        """Get seconds since epoch (UTC)."""
        return time.strftime("%Y-%m-%dT%H:%M:%SZ", time.localtime())

    def generate_password_digest(self, nonce, timestamp, password):
        """Get password digest."""
        sha1 = hashlib.sha1()
        sha1.update(base64.b64decode(nonce))
        sha1.update(bytes(timestamp, encoding="ascii"))
        sha1.update(bytes(password, encoding="ascii"))
        digest = sha1.digest()
        return base64.b64encode(digest).decode('ascii')
