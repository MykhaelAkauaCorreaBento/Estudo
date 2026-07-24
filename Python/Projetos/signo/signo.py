import random


def descobrir_signo(dia, mes):
    signos = [
        ((3, 21), (4, 19), "Áries", [
            "Áries: corajoso, determinado e cheio de energia.",
            "Áries: impulsivo, apaixonado e sempre pronto para agir.",
            "Áries: líder nato, cheio de iniciativa e entusiasmo."
        ]),
        ((4, 20), (5, 20), "Touro", [
            "Touro: determinado, paciente e com os pés no chão.",
            "Touro: estável, fiel e muito ligado às coisas boas da vida.",
            "Touro: resistente, sensível e admirado por sua constância."
        ]),
        ((5, 21), (6, 20), "Gêmeos", [
            "Gêmeos: curioso, comunicativo e adaptável.",
            "Gêmeos: inteligente, sociável e cheio de ideias.",
            "Gêmeos: versátil, rápido e sempre em busca de novidades."
        ]),
        ((6, 21), (7, 22), "Câncer", [
            "Câncer: intuitivo, protetor e sensível.",
            "Câncer: emocional, cuidadoso e muito ligado à família.",
            "Câncer: acolhedor, imaginoso e profundamente humano."
        ]),
        ((7, 23), (8, 22), "Leão", [
            "Leão: generoso, criativo e carismático.",
            "Leão: confiante, vibrante e sempre brilhante.",
            "Leão: alegre, forte e com grande presença."
        ]),
        ((8, 23), (9, 22), "Virgem", [
            "Virgem: analítico, dedicado e perfeccionista.",
            "Virgem: organizado, cuidadoso e muito observador.",
            "Virgem: prático, inteligente e sempre buscando melhorar."
        ]),
        ((9, 23), (10, 22), "Libra", [
            "Libra: diplomático, justo e harmonioso.",
            "Libra: elegante, equilibrado e apaixonado por convivência.",
            "Libra: gentil, artístico e sempre buscando o equilíbrio."
        ]),
        ((10, 23), (11, 21), "Escorpião", [
            "Escorpião: intenso, perspicaz e determinado.",
            "Escorpião: profundo, misterioso e emocionalmente forte.",
            "Escorpião: estratégico, apaixonado e extremamente resiliente."
        ]),
        ((11, 22), (12, 21), "Sagitário", [
            "Sagitário: aventureiro, otimista e independente.",
            "Sagitário: curioso, livre e cheio de energia positiva.",
            "Sagitário: ousado, inspirador e sempre em busca de aprender."
        ]),
        ((12, 22), (1, 19), "Capricórnio", [
            "Capricórnio: ambicioso, disciplinado e responsável.",
            "Capricórnio: focado, estratégico e muito determinado.",
            "Capricórnio: maduro, perseverante e cheio de disciplina."
        ]),
        ((1, 20), (2, 18), "Aquário", [
            "Aquário: inovador, independente e humanitário.",
            "Aquário: criativo, original e muito visionário.",
            "Aquário: pensador livre, curioso e cheio de ideias novas."
        ]),
        ((2, 19), (3, 20), "Peixes", [
            "Peixes: empático, criativo e intuitivo.",
            "Peixes: sensível, imaginativo e cheio de emoção.",
            "Peixes: compassivo, artístico e profundamente intuitivo."
        ]),
    ]

    for inicio, fim, signo, frases in signos:
        if (mes == inicio[0] and dia >= inicio[1]) or (mes == fim[0] and dia <= fim[1]):
            return signo, random.choice(frases)

    return None, "Data inválida. Verifique o dia e o mês."


dia = int(input("Digite o dia do seu nascimento: "))
mes = int(input("Digite o mês do seu nascimento: "))

signo, frase = descobrir_signo(dia, mes)

if signo is None:
    print(frase)
else:
    print(f"\nSeu signo é {signo}.")
    print(frase)