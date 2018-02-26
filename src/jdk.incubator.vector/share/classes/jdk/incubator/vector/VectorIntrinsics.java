package jdk.incubator.vector;

import jdk.internal.HotSpotIntrinsicCandidate;
import jdk.internal.misc.Unsafe;
import jdk.internal.vm.annotation.ForceInline;

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.Objects;
import java.util.function.*;

/*non-public*/ class VectorIntrinsics {
    static final Unsafe U = Unsafe.getUnsafe();

    static final long BUFFER_ADDRESS
            = U.objectFieldOffset(Buffer.class, "address");

    // Buffer.limit
    static final long BUFFER_LIMIT
            = U.objectFieldOffset(Buffer.class, "limit");

    // ByteBuffer.hb
    static final long BYTE_BUFFER_HB
            = U.objectFieldOffset(ByteBuffer.class, "hb");

    // ByteBuffer.isReadOnly
    static final long BYTE_BUFFER_IS_READ_ONLY
            = U.objectFieldOffset(ByteBuffer.class, "isReadOnly");

    // Unary
    static final int VECTOR_OP_ABS  = 0;
    static final int VECTOR_OP_NEG  = 1;
    static final int VECTOR_OP_SQRT = 2;
    static final int VECTOR_OP_NOT  = 3;

    // Binary
    static final int VECTOR_OP_ADD  = 4;
    static final int VECTOR_OP_SUB  = 5;
    static final int VECTOR_OP_MUL  = 6;
    static final int VECTOR_OP_DIV  = 7;
    static final int VECTOR_OP_MIN  = 8;
    static final int VECTOR_OP_MAX  = 9;

    static final int VECTOR_OP_AND  = 10;
    static final int VECTOR_OP_OR   = 11;
    static final int VECTOR_OP_XOR  = 12;

    // Ternary
    static final int VECTOR_OP_FMA  = 13;

    // Broadcast int
    static final int VECTOR_OP_LSHIFT  = 14;
    static final int VECTOR_OP_RSHIFT  = 15;
    static final int VECTOR_OP_URSHIFT = 16;

    // Math routines
    static final int VECTOR_OP_TAN = 101;
    static final int VECTOR_OP_TANH = 102;
    static final int VECTOR_OP_SIN = 103;
    static final int VECTOR_OP_SINH = 104;
    static final int VECTOR_OP_COS = 105;
    static final int VECTOR_OP_COSH = 106;
    static final int VECTOR_OP_ASIN = 107;
    static final int VECTOR_OP_ACOS = 108;
    static final int VECTOR_OP_ATAN = 109;
    static final int VECTOR_OP_ATAN2 = 110;
    static final int VECTOR_OP_CBRT = 111;
    static final int VECTOR_OP_LOG = 112;
    static final int VECTOR_OP_LOG10 = 113;
    static final int VECTOR_OP_LOG1P = 114;
    static final int VECTOR_OP_POW = 115;
    static final int VECTOR_OP_EXP = 116;
    static final int VECTOR_OP_EXPM1 = 117;
    static final int VECTOR_OP_HYPOT = 118;

    // Copied from open/src/hotspot/cpu/x86/assembler_x86.hpp
    // enum Condition { // The x86 condition codes used for conditional jumps/moves.
    static final int COND_zero          = 0x4;
    static final int COND_notZero       = 0x5;
    static final int COND_equal         = 0x4;
    static final int COND_notEqual      = 0x5;
    static final int COND_less          = 0xc;
    static final int COND_lessEqual     = 0xe;
    static final int COND_greater       = 0xf;
    static final int COND_greaterEqual  = 0xd;
    static final int COND_below         = 0x2;
    static final int COND_belowEqual    = 0x6;
    static final int COND_above         = 0x7;
    static final int COND_aboveEqual    = 0x3;
    static final int COND_overflow      = 0x0;
    static final int COND_noOverflow    = 0x1;
    static final int COND_carrySet      = 0x2;
    static final int COND_carryClear    = 0x3;
    static final int COND_negative      = 0x8;
    static final int COND_positive      = 0x9;
    static final int COND_parity        = 0xa;
    static final int COND_noParity      = 0xb;


    // enum BoolTest
    static final int BT_eq = 0;
    static final int BT_ne = 4;
    static final int BT_le = 5;
    static final int BT_ge = 7;
    static final int BT_lt = 3;
    static final int BT_gt = 1;
    static final int BT_overflow = 2;
    static final int BT_no_overflow = 6;

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static
    <VM>
    VM broadcastCoerced(Class<VM> vmClass, Class<?> elementType, int length,
                                  long bits,
                                  LongFunction<VM> defaultImpl) {
        return defaultImpl.apply(bits);
    }

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static
    <V extends Vector<?,?>>
    long reductionCoerced(int oprId, Class<?> vectorClass, Class<?> elementType, int length,
                          V v,
                          Function<V,Long> defaultImpl) {
        return defaultImpl.apply(v);
    }

    /* ============================================================================ */

    interface VecExtractOp<V> {
        long apply(V v1, int idx);
    }

    @HotSpotIntrinsicCandidate
    static
    <V extends Vector<?,?>>
    long extract(Class<?> vectorClass, Class<?> elementType, int vlen,
                 V vec, int ix,
                 VecExtractOp<V> defaultImpl) {
        return defaultImpl.apply(vec, ix);
    }

    /* ============================================================================ */

    interface VecInsertOp<V> {
        V apply(V v1, int idx, long val);
    }

    @HotSpotIntrinsicCandidate
    static <V extends Vector<?,?>>
    V insert(Class<V> vectorClass, Class<?> elementType, int vlen,
                        V vec, int ix, long val,
                        VecInsertOp<V> defaultImpl) {
        return defaultImpl.apply(vec, ix, val);
    }

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static
    <VM>
    VM unaryOp(int oprId, Class<VM> vmClass, Class<?> elementType, int length,
               VM vm, /*Vector.Mask<E,S> m,*/
               Function<VM, VM> defaultImpl) {
        return defaultImpl.apply(vm);
    }

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static
    <VM>
    VM binaryOp(int oprId, Class<? extends VM> vmClass, Class<?> elementType, int length,
                VM vm1, VM vm2, /*Vector.Mask<E,S> m,*/
                BiFunction<VM, VM, VM> defaultImpl) {
        return defaultImpl.apply(vm1, vm2);
    }

    /* ============================================================================ */

    interface TernaryOperation<V> {
        V apply(V v1, V v2, V v3);
    }

    @SuppressWarnings("unchecked")
    @HotSpotIntrinsicCandidate
    static
    <VM>
    VM ternaryOp(int oprId, Class<VM> vmClass, Class<?> elementType, int length,
                 VM vm1, VM vm2, VM vm3, /*Vector.Mask<E,S> m,*/
                 TernaryOperation<VM> defaultImpl) {
        return defaultImpl.apply(vm1, vm2, vm3);
    }

    /* ============================================================================ */

    // Memory operations

    interface LoadVectorOperation<C, V extends Vector<?,?>> {
        V load(C container, int index);
    }

    // @@@ Support endianness, pass in as argument to intrinsic
    @HotSpotIntrinsicCandidate
    static
    <C, V extends Vector<?,?>>
    V load(Class<?> vectorClass, Class<?> elementType, int length,
           Object base, long offset,    // Unsafe addressing
           // Vector.Mask<E,S> m,
           C container, int index,      // Arguments for default implementation
           LoadVectorOperation<C, V> defaultImpl) {
        return defaultImpl.load(container, index);
    }

    interface StoreVectorOperation<C, V extends Vector<?,?>> {
        void store(C container, int index, V v);
    }

    // @@@ Support endianness, pass in as argument to intrinsic
    @HotSpotIntrinsicCandidate
    static
    <C, V extends Vector<?,?>>
    void store(Class<?> vectorClass, Class<?> elementType, int length,
               Object base, long offset,    // Unsafe addressing
               V v,
               // Vector.Mask<E,S> m,
               C container, int index,      // Arguments for default implementation
               StoreVectorOperation<C, V> defaultImpl) {
        defaultImpl.store(container, index, v);
    }

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static
    <VM>
    boolean test(int cond, Class<?> vmClass, Class<?> elementType, int length,
                 VM vm1, VM vm2,
                 BiFunction<VM, VM, Boolean> defaultImpl) {
        return defaultImpl.apply(vm1, vm2);
    }

    /* ============================================================================ */

    interface VectorCompareOp<V,M> {
        M apply(V v1, V v2);
    }

    @HotSpotIntrinsicCandidate
    static <V extends Vector<E,S>,
            M extends Vector.Mask<E,S>,
            S extends Vector.Shape, E>
    M compare(int cond, Class<V> vectorClass, Class<M> maskClass, Class<?> elementType, int length,
              V v1, V v2,
              VectorCompareOp<V,M> defaultImpl) {
        return defaultImpl.apply(v1, v2);
    }

    /* ============================================================================ */

    interface VectorBlendOp<V extends Vector<E,S>,
                            M extends Vector.Mask<E,S>,
                            S extends Vector.Shape, E> {
        V apply(V v1, V v2, M mask);
    }

    @HotSpotIntrinsicCandidate
    static
    <V extends Vector<E,S>,
     M extends Vector.Mask<E,S>,
     S extends Vector.Shape, E>
    V blend(Class<V> vectorClass, Class<M> maskClass, Class<?> elementType, int length,
            V v1, V v2, M m,
            VectorBlendOp<V,M,S,E> defaultImpl) {
        return defaultImpl.apply(v1, v2, m);
    }

    /* ============================================================================ */

    interface VectorBroadcastIntOp<V extends Vector<?,?>> {
        V apply(V v, int i);
    }

    @HotSpotIntrinsicCandidate
    static
    <V extends Vector<?,?>>
    V broadcastInt(int opr, Class<V> vectorClass, Class<?> elementType, int length,
                   V v, int i,
                   VectorBroadcastIntOp<V> defaultImpl) {
        return defaultImpl.apply(v, i);
    }

    /* ============================================================================ */

    interface VectorReinterpretOp<VT, VF> {
        VT apply(VF v, Class<?> elementType);
    }

    @HotSpotIntrinsicCandidate
    static
    <VT, VF>
    VT reinterpret(Class<VF> fromVectorClass, Class<?> fromElementType, int fromVLen,
                   Class<?> toElementType, int toVLen, VF v,
                   VectorReinterpretOp<VT,VF> defaultImpl) {
        return defaultImpl.apply(v, toElementType);
    }

    /* ============================================================================ */

    interface VectorCastOp<VT, VF> {
        VT apply(VF v, Class<?> elementType);
    }

    @HotSpotIntrinsicCandidate
    static
    <VT, VF>
    VT cast(Class<VF> fromVectorClass, Class<?> fromElementType, int fromVLen,
            Class<?> toElementType, int toVLen, VF v,
            VectorCastOp<VT,VF> defaultImpl) {
        return defaultImpl.apply(v, toElementType);
    }

    /* ============================================================================ */

    @HotSpotIntrinsicCandidate
    static <V> V maybeRebox(V v) {
        // The fence is added here to avoid memory aliasing problems in C2 between scalar & vector accesses.
        // TODO: move the fence generation into C2. Generate only when reboxing is taking place.
        U.loadFence();
        return v;
    }

    /* ============================================================================ */

    static final int VECTOR_ACCESS_OOB_CHECK = Integer.getInteger("jdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK", 2);

    @ForceInline
    static int checkIndex(int ix, int length, int vlen) {
        switch (VectorIntrinsics.VECTOR_ACCESS_OOB_CHECK) {
            case 0: return ix; // no range check
            case 1: return Objects.checkFromIndexSize(ix, vlen, length);
            case 2: return Objects.checkIndex(ix, length - (vlen - 1));
            default: throw new InternalError();
        }
    }
}
