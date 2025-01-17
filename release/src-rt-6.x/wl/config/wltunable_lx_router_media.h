/*
 * Broadcom 802.11abg Networking Device Driver Configuration file
 *
 * Copyright (C) 2012, Broadcom Corporation. All Rights Reserved.
 * 
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 * $Id: wltunable_lx_router_media.h 316716 2012-02-23 04:39:13Z $
 *
 * wl driver tunables
 */

#define D11CONF		0x77a7baa0	/* D11 Core Rev 5 (4306C0), 7 (4712), 9 (4318b0, 5352),
					 * 11 (4321a1), 12 (4321b/c), 13 (5354), 15(4312),
					 * 16 (4322), 17 (4716), 18 (43224a0), 21 (5356),
					 * 23 (43224b0), 24 (4313), 25 (5357a0), 26 (4331a0),
					 * 28 (5357b0), 29 (4331B0), 30(43228).
					 */
#define D11CONF2	0x500		/* D11 Core Rev > 31, Rev 40(4360a0), 42(4360B0) */

#define NRXBUFPOST	56	/* # rx buffers posted */
#define RXBND		24	/* max # rx frames to process */
#define PKTCBND		36	/* max # rx frames to chain */
#define CTFPOOLSZ       64	/* max buffers in ctfpool */

#define WME_PER_AC_TX_PARAMS 1
#define WME_PER_AC_TUNING 1

#define NTXD_AC3X3		512	/* TX descriptor ring */
#define NRXD_AC3X3		512	/* RX descriptor ring */
#define NRXBUFPOST_AC3X3	320	/* # rx buffers posted */
#define RXBND_AC3X3		36	/* max # rx frames to process */
#define CTFPOOLSZ_AC3X3		512	/* max buffers in ctfpool */
#define PKTCBND_AC3X3		48	/* max # rx frames to chain */

#define TXMR			2	/* number of outstanding reads */
#define TXPREFTHRESH		8	/* prefetch threshold */
#define TXPREFCTL		16	/* max descr allowed in prefetch request */
#define TXBURSTLEN		256	/* burst length for dma reads */

#define RXPREFTHRESH		1	/* prefetch threshold */
#define RXPREFCTL		8	/* max descr allowed in prefetch request */
#define RXBURSTLEN		256	/* burst length for dma writes */

#define MRRS			512	/* Max read request size */

#define AMPDU_PKTQ_FAVORED_LEN 4096
