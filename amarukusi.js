"use strict";

const canvas = document.getElementById('canvas'),
    context = canvas.getContext('2d'),
    chakana = 321756043315785n,
    colorText = '#000',
    colorBody = '#fff',
    colorSun = '#00f',
    colorMoon = '#0f0',
    colorSelection = '#f00';

var box;
var selection = {
    x: -1,
    y: -1,
    w: 1,
    h: 1
};
var match = {
    player: 0,
    sun: {
        time: 12 * 60 * 1000,
        pieces: 7,
        kos: 0,
        kills: 0
    },
    moon: {
        time: 11 * 60 * 1000,
        pieces: 7,
        kos: 0,
        kills: 0
    }
};

function draw() {
    resize();

    drawBoard();

    if (selection.x > -1 && selection.y > -1) {
        drawSelection(
            selection.x,
            selection.y,
            selection.w,
            selection.h
        );
    }

    drawPlayers();
}

function resize() {
    const parent = document.body,
        width = parent.offsetWidth,
        height = parent.offsetHeight;

    box = Math.floor(Math.min(width, height) / 9);

    canvas.width = box * 9;
    canvas.height = box * 9;
}

function drawBoard() {
    context.clearRect(0, 0, canvas.width, canvas.height);

    for (let i = 0; i < 49; i++) {
        const x = Math.floor(i / 7) + 1, y = Math.floor(i % 7) + 1;

        if ((chakana & (1n << BigInt(i))) !== 0n) {
            context.fillStyle = colorText;
        } else {
            context.fillStyle = colorBody;
        }

        context.fillRect(
            box * x,
            box * y,
            box,
            box
        );
    }

    'abcdefg'.split('').forEach((x, i) => {
        drawText(i + 1, 0.4, 0.15, colorText, x);
        drawText(7 - i, 7.65, 0.15, colorText, x);

        drawText(0.4, i + 1, 0.15, colorText, i + 1);
        drawText(7.6, i + 1, 0.15, colorText, 7 - i);
    });
}

function drawSelection(x, y, w, h) {
    context.strokeStyle = colorSelection;
    context.lineWidth = box * 0.03;

    context.strokeRect(
        box * x,
        box * y,
        box * w,
        box * h
    );
}

function drawPlayers() {
    drawPiece(0, 0, 0, colorText);
    drawPiece(8, 8, 0, colorText);

    // Sun
    drawText(6.5, 0, 0.5, colorText, '12:00');
    drawText(1, 0, 0.5, colorText,
        match.sun.pieces.toString().padStart(2, '0')
    );
    drawText(0, 1, 0.5, colorText,
        match.sun.kos.toString().padStart(2, '0')
    );
    drawText(0, 2, 0.5, colorText,
        match.sun.kills.toString().padStart(2, '0')
    );

    // Moon
    drawText(1.5, 8, 0.5, colorText, '12:00');
    drawText(7, 8, 0.5, colorText,
        match.moon.pieces.toString().padStart(2, '0')
    );
    drawText(8, 7, 0.5, colorText,
        match.moon.kos.toString().padStart(2, '0')
    );
    drawText(8, 6, 0.5, colorText,
        match.moon.kills.toString().padStart(2, '0')
    );
}

function drawText(x, y, size, fill, text) {
    context.fillStyle = fill;

    context.textAlign = 'center';
    context.textBaseline = 'middle';

    context.font = (box * size) + 'px monospace';

    context.fillText(
        text,
        box * (x + 0.5),
        box * (y + 0.5)
    );
}

function drawPiece(x, y, position, fill) {
    const hole = [[0, -0.25], [-0.25, 0], [0, 0.25], [0.25, 0]][position];

    context.beginPath();

    context.fillStyle = fill;

    context.strokeStyle = colorText;
    context.arc(
        box * (x + 0.5),
        box * (y + 0.5),
        box * 0.45, 0,
        Math.PI * 2,
        false
    );
    context.arc(
        box * (x + 0.5 + hole[0]),
        box * (y + 0.5 + hole[1]),
        box * 0.15,
        0,
        Math.PI * 2,
        false
    );
    context.stroke();
    context.fill('evenodd');
}

function update(event) {
    const rect = canvas.getBoundingClientRect();
    const mouseX = (event.clientX - rect.left) * (canvas.width / rect.width);
    const mouseY = (event.clientY - rect.top) * (canvas.height / rect.height);
    const x = Math.floor(mouseX / box);
    const y = Math.floor(mouseY / box);

    switch (event.type) {
        case 'pointermove':
            selection.x = x;
            selection.y = y;

            draw();
            break;

        case 'pointerdown':
            break;

        case 'pointerup':
            break;


        case 'pointerleave':
            selection.x = -1;
            selection.y = -1;

            draw();
            break;

        default:
    }
}

window.onpointerup = update;
window.onpointerdown = update;
window.onpointermove = update;
window.onpointerleave = update;

window.onresize = draw;
draw();
